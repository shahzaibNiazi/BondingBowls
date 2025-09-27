// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// class RefineImage {
//
//
//   Future<File?> refineImage(File pickedFile) async {
//     final tempDir = await getTemporaryDirectory();
//     File toCompress = pickedFile;
//     CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
//       // cropStyle: CropStyle.circle,
//       sourcePath: toCompress.path,compressQuality: 25,
//       // aspectRatioPresets: Platform.isAndroid
//       //     ? [
//       //   CropAspectRatioPreset.square,
//       //   CropAspectRatioPreset.ratio3x2,
//       //   CropAspectRatioPreset.original,
//       //   CropAspectRatioPreset.ratio4x3,
//       //   CropAspectRatioPreset.ratio16x9
//       // ]
//       //     : [
//       //   CropAspectRatioPreset.original,
//       //   CropAspectRatioPreset.square,
//       //   CropAspectRatioPreset.ratio3x2,
//       //   CropAspectRatioPreset.ratio4x3,
//       //   CropAspectRatioPreset.ratio5x3,
//       //   CropAspectRatioPreset.ratio5x4,
//       //   CropAspectRatioPreset.ratio7x5,
//       //   CropAspectRatioPreset.ratio16x9
//       // ],
//       uiSettings:[ AndroidUiSettings(
//           toolbarTitle: 'Refine Image',
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false), IOSUiSettings(
//         title: 'Refine Image',
//
//       )],
//     );
//
//     if (croppedFile != null) {
//       pickedFile = File(croppedFile.path);
//       if (pickedFile.readAsBytesSync().lengthInBytes < 15242880) {
//         return pickedFile;
//       } else {
//         return null;
//       }
//     }
//   }
//
//
//   static Future getImageFromCamera() async {
//     final pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       File? returnFile = await RefineImage().refineImage(File(pickedFile.path));
//       Get.log('${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile');
//       return returnFile;
//     }
//   }
//
//   static Future getImageFromGallery() async {
//     var file =  await ImagePicker.platform.pickImage(source: ImageSource.gallery);
//     if (file != null) {
//       File? returnFile =
//       await RefineImage().refineImage(File(file.path));
//       Get.log('${DateTime.now()} [RefineImage.getImageFromGallery] $returnFile');
//       return returnFile;
//     }
//   }
// }
