// import 'dart:developer';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// class StabilityAIService {
//   final Dio dio = Dio();
//   final String apiKey =
//       'sk-lFyi1AeDR10BYNrjAFH8WdgMc7nLWcOKZIA0dd9xq8FYBaQE'; // 🔒 Don't expose in client builds
//
//   Future<File?> convertToAnimeStyle(File inputImage) async {
//     final url = 'https://api.stability.ai/v2beta/stable-image/generate/core';
//
//     try {
//       final formData = FormData.fromMap({
//         'image': await MultipartFile.fromFile(inputImage.path),
//         'style_preset': 'anime',
//         'prompt': 'Convert this image to anime portrait style',
//         'output_format': 'png',
//       });
//
//       final response = await dio.post(
//         url,
//         data: formData,
//         options: Options(
//           headers: {'Authorization': 'Bearer $apiKey', 'Accept': 'image/png'},
//           responseType: ResponseType.bytes,
//         ),
//       );
//
//       final outputFile = File(
//         '${Directory.systemTemp.path}/anime_${DateTime.now().millisecondsSinceEpoch}.png',
//       );
//       await outputFile.writeAsBytes(response.data);
//
//       log('✅ Anime-style image saved: ${outputFile.path}');
//       return outputFile;
//     } catch (e) {
//       log('❌ Error converting image: $e');
//       return null;
//     }
//   }
// }
