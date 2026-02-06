import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:http_parser/src/media_type.dart' as m;
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/global_var.dart';
import '../../../app/routes/app_pages.dart';
import '../../../app/utils/utils.dart';
import '../local_storage/local_db.dart';
import 'api_endpoint.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);

  final _client = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      followRedirects: true,
      maxRedirects: 3,
      connectTimeout: Duration(milliseconds: 120 * 1000),
      receiveTimeout: Duration(milliseconds: 120 * 1000),
    ),
  );

  APIProvider() {
    _client.interceptors.add(DioLogInterceptor());
  }

  /// Helper: build a FormData from a Map; if any value is a MultipartFile it will be attached as a file.
  FormData _makeFormData(Map<String, dynamic> body) {
    return FormData.fromMap(
      body.map((key, value) {
        // If you've already wrapped a File in MultipartFile, leave it.
        if (value is MultipartFile) {
          return MapEntry(key, value);
        }
        // Otherwise just pass the primitive or string
        return MapEntry(key, value?.toString() ?? '');
      }),
    );
  }

  Future basePostFormAPI(
    String url,
    Map<String, dynamic> body,
    bool? auth,
    BuildContext context, {
    String? successMsg,
    bool? loading,
    bool direct = false,
    String? fullUrl,
  }) async {
    final dialog = SimpleFontelicoProgressDialog(context: context);
    if (loading == true) {
      dialog.show(
        indicatorColor: AppColors.lightBlack,
        message: 'Loading...',
        textStyle: TextStyle(color: AppColors.lightBlack),
        type: SimpleFontelicoProgressDialogType.normal,
      );
    }

    try {
      Response response;

      // Convert body map into FormData
      final formData = _makeFormData(body);

      // Decide URL
      final target = fullUrl ?? (ApiEndPoints.baseUrl + url);

      if (auth == null || auth == true) {
        log(target);
        log(body.toString());
        log("auth true");
        log("auth token...${Globals.authToken}");

        response = await _client.post(
          target,
          data: formData,
          options: Options(
            contentType: 'multipart/form-data',
            headers: {'authorization': "Bearer ${Globals.authToken}"},
          ),
        );
      } else {
        log(target);
        log("auth false");
        log(body.toString());

        response = await _client.post(
          target,
          data: formData,
          options: Options(contentType: 'multipart/form-data'),
        );
      }

      dialog.hide();
      log(response.toString());
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      dialog.hide();
      throw TimeOutException(null);
    } on SocketException {
      dialog.hide();
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      dialog.hide();
      Utils.showToast(message: 'Try again Later');

      // If the API returns a plain string
      if (e.response?.data is String) {
        if (e.response!.data.contains("limit")) {
          return null;
        } else {
          return {"statusCode": 401};
        }
      }

      return _returnResponse(e.response);
    }
  }

  Future baseGetAPI(
    url,
    query,
    auth,
    context, {
    successMsg,
    loading,
    bool direct = false,
    String? fullUrl,
  }) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
      context: context,
    );
    if (loading == true && loading != null) {
      dialog.show(
        indicatorColor: AppColors.primary,
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
      );
    }

    log(fullUrl ?? (ApiEndPoints.baseUrl + url));
    try {
      Response response;
      if (auth == null || auth == true) {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log(
          "[APIProvider.baseGetAPI Authed] called with : ${Globals.authToken}",
        );
        response = await _client.get(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}",
            },
          ),
          // queryParameters: query as Map<String, dynamic>
        );
      } else {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log("[APIProvider.baseGetAPI unAuthed] called");
        response = await _client.get(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          options: Options(
            headers: <String, String>{'Content-Type': 'application/json'},
          ),
        );
      }
      dialog.hide();
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      if (e.response != null) {
        dialog.hide();
        return _returnResponse(e.response!);
      } else {
        dialog.hide();
        return "No internet connection";
      }
    }
  }

  Future checkStatusAPI(
    url,
    auth,
    context, {
    successMsg,
    loading,
    bool direct = false,
    String? fullUrl,
  }) async {
    try {
      Response response;
      if (auth == null || auth == true) {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log(
          "[APIProvider.baseGetAPI Authed] called with : ${Globals.authToken}",
        );
        response = await _client.get(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}",
            },
          ),
        );
      } else {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log("[APIProvider.baseGetAPI unAuthed] called");
        response = await _client.get(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          options: Options(
            headers: <String, String>{'Content-Type': 'application/json'},
          ),
        );
      }
      return response.statusCode;
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.statusCode);
      }
      if (e.response?.data.runtimeType == String) {
        if (e.response?.data.contains("limit")) {
          return e.response?.statusCode;
        } else {
          return e.response?.statusCode;
        }
      } else {
        return e.response?.statusCode;
      }
    }
  }

  Future basePostAPI(
    url,
    body,
    auth,
    context, {
    successMsg,
    loading,
    bool direct = false,
    fullUrl,
  }) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
      context: context,
    );
    if (loading == true && loading != null) {
      dialog.show(
        indicatorColor: AppColors.lightBlack,
        message: 'Loading...',
        textStyle: TextStyle(color: AppColors.lightBlack),
        type: SimpleFontelicoProgressDialogType.normal,
      );
    }
    try {
      Response response;
      if (auth == null || auth == true) {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log(jsonEncode(body));
        log("auth true");
        log("auth token...${Globals.authToken}");
        response = await _client.post(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          data: body,
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}",
            },
          ),
        );
      } else {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log("auth false");
        log(jsonEncode(body));
        response = await _client.post(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          data: body,
          options: Options(
            headers: <String, String>{'Content-Type': 'application/json'},
          ),
        );
      }
      dialog.hide();
      log(response.toString());
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      // log(e.toString());
      // // return _returnResponse(e.response);
      //
      // log(e.toString());

      // Utils.showToast(message: 'Try again Later');
      // Utils.showToast(message: e.error.toString());

      dialog.hide();
      if (e.response?.data.runtimeType == String) {
        dialog.hide();
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          dialog.hide();
          // pr.close();
          // Utils().showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        dialog.hide();

        // pr.close();
        // return e.response?.data;
        return _returnResponse(e.response);
      }
    }
  }

  Future baseDeleteAPI(
    url,
    body,
    auth,
    context, {
    successMsg,
    loading,
    bool direct = false,
    fullUrl,
  }) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
      context: context,
    );
    if (loading == true && loading != null) {
      dialog.show(
        indicatorColor: AppColors.lightBlack,
        message: 'Loading...',
        textStyle: TextStyle(color: AppColors.lightBlack),
        type: SimpleFontelicoProgressDialogType.normal,
      );
    }
    try {
      Response response;
      if (auth == null || auth == true) {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log(jsonEncode(body));
        log("auth true");
        log("auth token...${Globals.authToken}");
        response = await _client.delete(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          data: body,
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}",
            },
          ),
        );
      } else {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log("auth false");
        log(jsonEncode(body));
        response = await _client.post(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          data: body,
          options: Options(
            headers: <String, String>{'Content-Type': 'application/json'},
          ),
        );
      }
      dialog.hide();
      log(response.toString());
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      // log(e.toString());
      // // return _returnResponse(e.response);
      //
      // log(e.toString());

      // Utils.showToast(message: 'Try again Later');
      // Utils.showToast(message: e.error.toString());

      dialog.hide();
      if (e.response?.data.runtimeType == String) {
        dialog.hide();
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          dialog.hide();
          // pr.close();
          // Utils().showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        dialog.hide();

        // pr.close();
        // return e.response?.data;
        return _returnResponse(e.response);
      }
    }
  }

  Future tokenPostApi(body, context, {successMsg, loading}) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
      context: context,
    );
    if (loading == true && loading != null) {
      dialog.show(
        indicatorColor: AppColors.primary,
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
      );
    }
    try {
      Response response;
      log(jsonEncode(body));
      response = await _client.post(
        "https://api.sandbox.checkout.com/tokens",
        data: body,
        options: Options(
          headers: <String, String>{
            'authorization': "pk_sbox_2mhlxi24rr6fyjngblns6phbqmw",
          },
        ),
      );
      dialog.hide();
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      dialog.hide();
      // pr.close();
      log(e.response?.data);
      if (e.response?.data.runtimeType == String) {
        dialog.hide();
        // pr.close();
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          dialog.hide();
          // pr.close();
          // Utils().showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        dialog.hide();
        // pr.close();
        return e.response?.data;
      }
    }
  }

  Future basePutAPI(
    url,
    body,
    auth,
    context, {
    successMsg,
    loading,
    bool direct = false,
    fullUrl,
  }) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
      context: context,
    );
    if (loading == true && loading != null) {
      dialog.show(
        indicatorColor: AppColors.lightBlack,
        message: 'Loading...',
        textStyle: TextStyle(color: AppColors.lightBlack),
        type: SimpleFontelicoProgressDialogType.normal,
      );
    }
    try {
      Response response;
      if (auth == null || auth == true) {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log(jsonEncode(body));
        log("auth true");
        response = await _client.patch(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          data: body,
          options: Options(
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}",
            },
          ),
        );
      } else {
        log(fullUrl ?? (ApiEndPoints.baseUrl + url));
        log("auth false");
        log(jsonEncode(body));
        response = await _client.put(
          fullUrl ?? (ApiEndPoints.baseUrl + url),
          data: body,
          options: Options(
            headers: <String, String>{'Content-Type': 'application/json'},
          ),
        );
      }
      dialog.hide();
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      dialog.hide();
      if (e.response?.data.runtimeType == String) {
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          return {"statusCode": 401};
        }
      } else {
        return e.response?.data;
      }
    }
  }

  Future baseMultiPartAPI(
    url,
    body,
    auth,
    context,
    File file, {
    successMsg,
    loading,
    bool direct = false,
    Function(int sent, int total)? progress,
  }) async {
    String fileName = file.path.split("/").last;
    try {
      FormData? formData;
      _client.options.headers.addAll({
        "authorization": "Bearer ${Globals.authToken}",
      });
      Response response;
      formData = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: m.MediaType(
            'image',
            fileName.split(".").last.toLowerCase(),
          ),
        ),
      });
      response = await _client.post(
        ApiEndPoints.baseUrl + url,
        data: formData,
        onSendProgress: (int sent, int total) {
          log('$sent : $total');
          if (progress != null) {
            progress(sent, total);
          }
        },
      );

      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      log(e.response?.data);
      if (e.response?.data.runtimeType == String) {
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          // Utils.showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        return e.response?.data;
      }
    }
  }

  Future baseMultipartPersonalInfo(
    String url,
    Map<String, dynamic> body,
    File storeLogo,
    context, {
    Function(int sent, int total)? progress,
  }) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
      context: context!,
    );
    dialog.show(
      indicatorColor: AppColors.primary,
      message: 'Loading...',
      type: SimpleFontelicoProgressDialogType.normal,
    );
    String storeName = storeLogo.path.split("/").last;
    _client.options.headers.addAll({
      "authorization": "Bearer ${Globals.authToken}",
    });
    try {
      var formData = FormData.fromMap({
        ...body,
        "avatar": await MultipartFile.fromFile(
          storeLogo.path,
          filename: storeName,
          contentType: m.MediaType(
            'image',
            storeName.split(".").last.toLowerCase(),
          ),
        ),
      });
      Response response = await _client.patch(
        ApiEndPoints.baseUrl + url,
        data: formData,
        onSendProgress: (int sent, int total) {
          if (progress != null) {
            progress(sent, total);
          }
        },
      );
      dialog.hide();
      return response.data;
    } on TimeoutException catch (_) {
      dialog.hide();
      throw TimeoutException("Request timed out");
    } on SocketException {
      dialog.hide();
      throw SocketException("No Internet connection");
    } on DioException catch (e) {
      dialog.hide();
      if (e.response?.data is String && e.response?.data.contains("limit")) {
        return null;
      } else {
        return e.response?.data ?? {"statusCode": 401};
      }
    }
  }

  Future baseMultipartPersonalInfoPatch(
    String url,
    Map<String, dynamic> body,
    File storeLogo,
    context, {
    Function(int sent, int total)? progress,
  }) async {
    SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
      context: context!,
    );
    dialog.show(
      indicatorColor: AppColors.primary,
      message: 'Loading...',
      type: SimpleFontelicoProgressDialogType.normal,
    );
    String storeName = storeLogo.path.split("/").last;
    _client.options.headers.addAll({
      "authorization": "Bearer ${Globals.authToken}",
    });
    try {
      var formData = FormData.fromMap({
        ...body,
        "avatar": await MultipartFile.fromFile(
          storeLogo.path,
          filename: storeName,
          contentType: m.MediaType(
            'image',
            storeName.split(".").last.toLowerCase(),
          ),
        ),
      });
      Response response = await _client.patch(
        ApiEndPoints.baseUrl + url,
        data: formData,
        onSendProgress: (int sent, int total) {
          if (progress != null) {
            progress(sent, total);
          }
        },
      );
      dialog.hide();
      return response.data;
    } on TimeoutException catch (_) {
      dialog.hide();
      throw TimeoutException("Request timed out");
    } on SocketException {
      dialog.hide();
      throw SocketException("No Internet connection");
    } on DioException catch (e) {
      dialog.hide();
      if (e.response?.data is String && e.response?.data.contains("limit")) {
        return null;
      } else {
        return e.response?.data ?? {"statusCode": 401};
      }
    }
  }

  dynamic _returnResponse(Response<dynamic>? response) {
    switch (response?.statusCode) {
      case 200:
        log("200");
        return response?.data;
      case 201:
        log("201");
        // print(response.data);
        return response?.data;
      case 400:
        if (response?.data != null) {
          Utils.showSnackBar('Error', response?.data['message'], Colors.red);
        }
        throw BadRequestException(response?.data.toString());
      case 401:
        // refreshToken();
        // _client.close();
        // token issue\

        // if (response?.data['code'] == 'token_not_valid') {
        // }
        g.Get.offAllNamed(Routes.LOGIN);
        LocalDB.clear();
        Utils.showToast(message: 'Session Expired');

        return response?.data;

        throw BadRequestException(response?.data.toString());
      case 403:
        if (response?.data['error'] != null) {
          Utils.showToast(message: response?.data['error']);
        } else {
          Utils.showToast(message: response?.data['data']['error']);
        }
        throw UnauthorisedException(response?.data.toString());
      case 404:
        return response?.data;
        if (response?.data['error'] != null) {
          log("Error --------{response?.data['error']}");
          Utils.showToast(message: response?.data['error']);
        } else {
          Utils.showToast(message: response?.data['data']['error']);
        }
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        log("default");
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response?.statusCode}',
        );
    }
  }

  // refreshToken() async {

  // }
}

class AppException implements Exception {
  final code;
  String? message;
  final details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
    : super(
        code: "fetch-data",
        message: "Error During Communication",
        details: details,
      );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
    : super(
        code: "invalid-request",
        message: "Invalid Request",
        details: details,
      );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
    : super(code: "unauthorised", message: "Unauthorised", details: details);
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
    : super(code: "invalid-input", message: "Invalid Input", details: details);
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
    : super(
        code: "authentication-failed",
        message: "Authentication Failed",
        details: details,
      );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
    : super(
        code: "request-timeout",
        message: "Request TimeOut",
        details: details,
      );
}
