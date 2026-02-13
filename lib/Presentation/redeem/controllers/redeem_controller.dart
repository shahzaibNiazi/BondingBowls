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

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      voucherDetailModel = VoucherDetailModel.fromJson({
        "id": "1",
        "voucherCode": "ABC123",
        "isRedeemed": false,
        "displayInfo": {
          "outletDetails": {
            "name": "McDonald's",
          },
          "images": {
            "mainImage": "https://as1.ftcdn.net/jpg/06/98/47/02/1000_F_698470208_RRblsEDsd1VWqwRsMu9SQ6Xq2CAa3wyR.jpg", // keep empty if you don’t want network image
          },
          "conditionsList": [
            "Applicable to all McCafé drinks",
            "Not claimable at VivoCity, Jewel & SunMall Outlets",
            "Only Available from 8am - 11am",
            "First 50 Users per outlet",
            "Available for Dine-In or Takeaway"
          ],
          "termsList": [
            "Bonding Bowls and participating outlets may at any time in its sole and absolute discretion withdraw, amend and/or alter any applicable terms and conditions of the voucher, deals or promotions, exclude, void, discontinue or disqualify you from any voucher, deal or promotion without prior notice",
            "Participating store can choose to void voucher if user did not present screen to cashier/staff before swiping to claim on the voucher.",
            "Bonding Bowls and participating outlet reserve the right to amend, update, or modify these Terms of Use at any time, at our sole discretion.",
            "Only one promotion may be applied per order. Voucher codes cannot be used in conjunction with other discounts.."
          ]
        }
      });

      isRedeem.value = voucherDetailModel?.isRedeemed ?? false;

      update();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }




  // Future<void> getVoucherDetails(id) async {
  //   isLoading.value = true;
  //   try {
  //     final response = await profileCreationRepository.getVoucherDetails(id);
  //
  //     log('Length ----- ${response.toString()}');
  //
  //     if (response != null && response['success'] == true) {
  //       // Parse JSON → Immutable Model
  //       final detail = response['data'];
  //
  //       final voucher = VoucherDetailModel.fromJson(detail);
  //       voucherDetailModel = voucher;
  //
  //       isRedeem.value = voucherDetailModel?.isRedeemed ?? false;
  //     }
  //     isLoading.value = false;
  //     update();
  //     log(response.toString());
  //   } catch (e) {
  //     isLoading.value = false;
  //     update();
  //     log(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //     update();
  //   }
  // }


  Future<void> redeemVoucher(String voucherId, String voucherCode) async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      Utils.showSnackBar(
        'Voucher redeemed successfully!',
        '',
        AppColors.green,
      );

      isRedeem.value = true;
      update();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }



  // Future<void> redeemVoucher(String voucherId, String voucherCode) async {
  //   log(voucherId);
  //   log(voucherCode);
  //   Map<String, dynamic> json = {
  //     "voucherId": voucherId,
  //     "voucherCode": voucherCode,
  //   };
  //   isLoading.value = true;
  //   try {
  //     final response = await profileCreationRepository.redeemVoucher(json);
  //
  //     log('Length ----- ${response.toString()}');
  //
  //     //
  //     if (response != null && response['success'] == true) {
  //       // Parse JSON → Immutable Model
  //       final detail = response['data'];
  //       Utils.showSnackBar(
  //         'Voucher redeemed successfully!',
  //         '',
  //         AppColors.green,
  //       );
  //
  //       isRedeem.value = true;
  //       //
  //       // final voucher = VoucherDetailModel.fromJson(detail);
  //       // voucherDetailModel = voucher;
  //     }
  //     isLoading.value = false;
  //     update();
  //     log(response.toString());
  //   } catch (e) {
  //     isLoading.value = false;
  //     update();
  //     log(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //     update();
  //   }
  // }
}
