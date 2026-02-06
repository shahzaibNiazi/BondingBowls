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

class MatchMakingSettingController extends GetxController {
  //TODO: Implement MatchMakingSettingController

  final count = 0.obs;
  RangeValues ageRange = const RangeValues(25, 40);
  String selectedGender = 'Female';
  String selectedIntention = 'Any';
  String selectedNationality = 'SG/PR';
  String selectedReligion = 'Any';

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  bool isReligionUnlocked = false; // Track if religion filter is unlocked
  SimpleFontelicoProgressDialog dialog = SimpleFontelicoProgressDialog(
    context: Get.context!,
  );
  @override
  void onInit() {
    super.onInit();

    log(Globals.user!.toJson().toString());

    if (Globals.user != null) {
      selectedGender = Globals.user?.preferredGender ?? '';
      selectedIntention =
          (Globals.user?.preferredDatingIntentions?.isNotEmpty == true)
          ? Globals.user!.preferredDatingIntentions!.first
          : '';

      selectedNationality =
          (Globals.user?.preferredNationality?.isNotEmpty == true)
          ? Globals.user!.preferredNationality!.first
          : '';

      selectedReligion = (Globals.user?.preferredReligion?.isNotEmpty == true)
          ? Globals.user!.preferredReligion!.first
          : '';

      double min =
          double.tryParse(Globals.user?.minAge?.toString() ?? '') ?? 25.0;
      double max =
          double.tryParse(Globals.user?.maxAge?.toString() ?? '') ?? 40.0;

      if (min > max) {
        final temp = min;
        min = max;
        max = temp;
      }

      // Clamp values to valid range
      min = min.clamp(18.0, 67.0);
      max = max.clamp(18.0, 67.0);

      ageRange = RangeValues(min, max);
    }
  }

  Future<void> updateMatchMaking() async {
    try {
      Map<String, dynamic> json = {
        "minAge": ageRange.start.round(),
        "maxAge": ageRange.end.round(),
        "preferredGender": selectedGender,
        "preferredDatingIntentions": selectedIntention,
        "preferredNationality": selectedNationality,
        "preferredReligion": selectedReligion,
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

          log(Globals.user!.toJson().toString());

          Utils.showSnackBar(
            'Success',
            "Matchmaking updated successfully",
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

  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.shade100,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void onReligionUnlocked() {
    isReligionUnlocked = true;
    update();
    showSnackBar("Religion filter unlocked successfully!");
  }

  void ageUpdate(details, context, trackWidth, startPos, endPos) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    double localPosition =
        renderBox.globalToLocal(details.globalPosition).dx - 24;
    double percentage = (localPosition / trackWidth).clamp(0.0, 1.0);
    double newValue = 18 + (percentage * 49); // 18 to 67 range (49 years)

    // Determine which thumb is closer
    double startDistance = (startPos - localPosition).abs();
    double endDistance = (endPos - localPosition).abs();

    if (startDistance < endDistance) {
      // Move start thumb
      double newStart = newValue.clamp(18.0, ageRange.end - 1);
      ageRange = RangeValues(newStart, ageRange.end);
    } else {
      // Move end thumb
      double newEnd = newValue.clamp(ageRange.start + 1, 67.0);
      ageRange = RangeValues(ageRange.start, newEnd);
    }
    update();
  }
}
