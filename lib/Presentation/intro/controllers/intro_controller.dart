import 'dart:convert';
import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/global_var.dart';
import '../../../app/utils/utils.dart';
import '../../../data/model/user_model.dart';
import '../../../data/provider/local_storage/local_db.dart';

class IntroController extends GetxController {
  //TODO: Implement IntroController

  final count = 0.obs;
  final TextEditingController favoriteQuotesController =
      TextEditingController();
  final TextEditingController beforeAnythingController =
      TextEditingController();
  bool canSave = false;
  SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
    context: Get.context!,
  );
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  String favoriteQuotes = '';
  String beforeAnything = '';

  @override
  void onInit() {
    super.onInit();
    favoriteQuotesController.addListener(checkCanSave);
    beforeAnythingController.addListener(checkCanSave);

    favoriteQuotesController.text = Globals.user?.favoriteQuotes ?? '';
    beforeAnythingController.text = Globals.user?.beforeAnything ?? '';
  }

  void updateFavoriteQuotes(String value) {
    favoriteQuotes = value;
    update();
  }

  void updateBeforeAnything(String value) {
    beforeAnything = value;
    update();
  }

  void checkCanSave() {
    canSave =
        favoriteQuotesController.text.isNotEmpty ||
        beforeAnythingController.text.isNotEmpty;
  }

  // Helper method to check if favorite quotes field should be enabled
  bool isFavoriteQuotesEnabled() {
    return beforeAnythingController.text.isEmpty;
  }

  // Helper method to check if before anything field should be enabled
  bool isBeforeAnythingEnabled() {
    return favoriteQuotesController.text.isEmpty;
  }

  Future<void> updateIntro() async {
    if (favoriteQuotes.isEmpty && beforeAnything.isEmpty) {
      Utils.showSnackBar('Validation', "Please add intro", Colors.red);
      return;
    }

    try {
      Map<String, dynamic> json = {
        "favoriteQuotes": favoriteQuotes,
        "beforeAnything": beforeAnything,
      };

      dialog.show(
        indicatorColor: AppColors.lightBlack,
        message: 'Loading...',
        textStyle: TextStyle(color: AppColors.lightBlack),
        type: SimpleFontelicoProgressDialogType.normal,
      );

      final response = await profileCreationRepository.profileCreation(json);

      log(response.toString());

      if (response != null) {
        if (response['profile'] != null) {
          UserModel user = UserModel.fromJson(response['profile']);
          await LocalDB.setData('user_data', user.toJson());
          Globals.user = UserModel.fromJson(
            jsonDecode(await LocalDB.getData('user_data')),
          );

          Utils.showSnackBar(
            'Success',
            "User profile updated successfully",
            Colors.green,
          );
          dialog.hide();
          update();
        }
      }
    } catch (e) {
      log('-----Strings----${e.toString()}');
      dialog.hide();
    } finally {
      dialog.hide();
    }
  }
}
