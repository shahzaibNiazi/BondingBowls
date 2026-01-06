import 'dart:developer';

import 'package:convo_hearts/data/model/voucher_detail_model.dart';
import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/utils/utils.dart';

class RedeemController extends GetxController {
  //TODO: Implement RedeemController

  final count = 0.obs;
  RxBool isLoading = false.obs;

  RxBool isRedeem = false.obs;

  VoucherDetailModel? voucherDetailModel;

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();
  String? voucherId;
  void increment() => count.value++;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    voucherId = Get.arguments?['id'];
    if (voucherId != null) {
      getVoucherDetails(voucherId);
    }
  }

  Future<void> getVoucherDetails(id) async {
    isLoading.value = true;
    try {
      final response = await profileCreationRepository.getVoucherDetails(id);

      log('Length ----- ${response.toString()}');

      if (response != null && response['success'] == true) {
        // Parse JSON → Immutable Model
        final detail = response['data'];

        final voucher = VoucherDetailModel.fromJson(detail);
        voucherDetailModel = voucher;

        isRedeem.value = voucherDetailModel?.isRedeemed ?? false;
      }
      isLoading.value = false;
      update();
      log(response.toString());
    } catch (e) {
      isLoading.value = false;
      update();
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> redeemVoucher(String voucherId, String voucherCode) async {
    log(voucherId);
    log(voucherCode);
    Map<String, dynamic> json = {
      "voucherId": voucherId,
      "voucherCode": voucherCode,
    };
    isLoading.value = true;
    try {
      final response = await profileCreationRepository.redeemVoucher(json);

      log('Length ----- ${response.toString()}');

      //
      if (response != null && response['success'] == true) {
        // Parse JSON → Immutable Model
        final detail = response['data'];
        Utils.showSnackBar(
          'Voucher redeemed successfully!',
          '',
          AppColors.green,
        );

        isRedeem.value = true;
        //
        // final voucher = VoucherDetailModel.fromJson(detail);
        // voucherDetailModel = voucher;
      }
      isLoading.value = false;
      update();
      log(response.toString());
    } catch (e) {
      isLoading.value = false;
      update();
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
