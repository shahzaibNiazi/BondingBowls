import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/voucher_model.dart';
import '../widgets/sort_bottom.dart';

class VouchersController extends GetxController {
  //TODO: Implement VouchersController
  String currentSort = 'Recent (Default)';
  final count = 0.obs;
  RxBool isLoading = false.obs;
  List<VoucherModel> vouchers = [];

  String filter = 'recent';

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  @override
  void onInit() {
    super.onInit();
    getVouchers();
  }

  void showSortBottomSheet() {
    showModalBottomSheet<String>(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(104, 0, 0, 0),
      builder: (BuildContext context) {
        return SortBottomSheet(selectedOption: currentSort);
      },
    ).then((selectedSort) {
      if (selectedSort != null) {
        currentSort = selectedSort;

        if (currentSort == 'Recent (Default)') {
          filter = 'recent';
        } else if (currentSort == 'Expiring First') {
          filter = 'expiringFirst';
        } else if (currentSort == 'Expiring Last') {
          filter = 'expiringLast';
        }

        getVouchers();
        log('Selected sort: $selectedSort');
      }
    });
  }


  Future<void> getVouchers() async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));
    // small delay to simulate loading

    try {
      vouchers = [
        VoucherModel(
          id: "1",
          title: "20% off on all Macdonald’s item",
          discountValue: 20,
          startDate: "2025-12-01",
          expiryDate: "2025-12-07",
          currentUsageCount: 3,
        ),
        VoucherModel(
          id: "2",
          title: "Buy 1 Get 1 Free Pizza",
          discountValue: 50,
          startDate: "2025-12-02",
          expiryDate: "2025-12-10",
          currentUsageCount: 1,
        ),
        VoucherModel(
          id: "3",
          title: "Flat 100৳ off on Orders above 500৳",
          discountValue: 100,
          startDate: "2025-12-01",
          expiryDate: "2025-12-15",
          currentUsageCount: 5,
        ),
        VoucherModel(
          id: "4",
          title: "15% off on KFC Meals",
          discountValue: 15,
          startDate: "2025-12-05",
          expiryDate: "2025-12-20",
          currentUsageCount: 2,
        ),
      ];

      update();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }


// Future<void> getVouchers() async {
  //   isLoading.value = true;
  //   try {
  //     final response = await profileCreationRepository.getVouchers(filter);
  //
  //     log('Length ----- ${response.toString()}');
  //
  //     if (response != null && response['success'] == true) {
  //       // Parse JSON → Immutable Model
  //       final List voucher = response['data']?['vouchers'] ?? [];
  //
  //       final voucherList = voucher
  //           .map((e) => VoucherModel.fromJson(e))
  //           .toList();
  //
  //       vouchers = voucherList;
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
