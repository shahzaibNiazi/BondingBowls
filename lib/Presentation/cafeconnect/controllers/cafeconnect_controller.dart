import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/cafeConnect_model.dart';

class CafeconnectController extends GetxController {
  //TODO: Implement CafeconnectController

  final count = 0.obs;

  List<CafeModel> cafeList = [];

  String selectedTag = 'Hot';
  String? selectedLocation;
  String? selectedCategory;
  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCafeConnect();
    });
  }

  void selectFilter(String location, String category) async {
    selectedLocation = location;
    selectedLocation = category;
    cafeList.clear();
    update();

    await getCafeConnect();
  }

  void clearFilter() async {
    selectedCategory = '';
    selectedLocation = '';
    cafeList.clear();
    update();

    await getCafeConnect();
  }

  void selectTag(String tag) async {
    selectedTag = tag;
    cafeList.clear();
    update();

    await getCafeConnect();
  }

  Future<void> getCafeConnect() async {
    isLoading.value = true;
    // try {
    final response = await profileCreationRepository.getCafe(
      selectedTag.toLowerCase(),
      selectedLocation ?? '',
      selectedCategory ?? '',
    );

    if (response != null && response['success'] == true) {
      var data = response['data']
          .map<CafeModel>((e) => CafeModel.fromJson(e))
          .toList();

      cafeList = data;

      log('Length ------ ${cafeList.length}');
      update();

      // Parse JSON → Immutable Model
      // Access data (immutable!)
    }
    isLoading.value = false;
    update();
    log(response.toString());
    // } catch (e) {
    //   isLoading.value = false;
    //
    //   log(e.toString());
    // }
  }
}
