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
    try {
      final response = await profileCreationRepository.getVouchers(filter);

      log('Length ----- ${response.toString()}');

      if (response != null && response['success'] == true) {
        // Parse JSON → Immutable Model
        final List voucher = response['data']?['vouchers'] ?? [];

        final voucherList = voucher
            .map((e) => VoucherModel.fromJson(e))
            .toList();

        vouchers = voucherList;
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
