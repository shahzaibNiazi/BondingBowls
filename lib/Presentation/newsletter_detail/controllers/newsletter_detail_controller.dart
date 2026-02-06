import 'dart:developer';

import 'package:convo_hearts/data/model/newsletter_model.dart';
import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/utils/utils.dart';

class NewsletterDetailController extends GetxController {
  //TODO: Implement NewsletterDetailController

  final count = 0.obs;
  Item? item;
  RxBool isLoading = false.obs;
  RxBool isRedeem = false.obs;

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments['item'];

    isRedeem.value = item?.voucherDetails?.isRedeemed ?? false;
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
