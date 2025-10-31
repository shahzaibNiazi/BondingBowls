import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ManuallyVerifySecondController extends GetxController {
  //TODO: Implement ManuallyVerifySecondController

  final count = 0.obs;

  final Rx<File?> capturedVideo = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? videoPlayerController;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> captureVideo() async {
    final XFile? video = await _picker.pickVideo(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (video != null) {
      capturedVideo.value = File(video.path);
      videoPlayerController = VideoPlayerController.file(capturedVideo.value!)
        ..initialize().then((_) {
          videoPlayerController!.play();
          update();
        });
    }
  }

  clear() {
    capturedVideo.value = null;
    update();
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      capturedVideo.value = File(image.path);
    }
  }

  void removeImage() {
    capturedVideo.value = null;
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
