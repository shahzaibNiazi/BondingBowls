import 'dart:developer';

import 'package:convo_hearts/data/repositories/profile_creation_repository.dart';
import 'package:get/get.dart';

import '../../../data/model/newsletter_model.dart';

class NewsletterController extends GetxController {
  //TODO: Implement NewsletterController

  ProfileCreationRepository profileCreationRepository =
      ProfileCreationRepository();

  List<Item> foodItems = [];
  List<Item> beveragesItems = [];
  List<Item> eventsItems = [];

  RxBool isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getNewsLetter();
  }

  Future<void> getNewsLetter() async {
    isLoading.value = true;
    try {
      final response = await profileCreationRepository.getNewsLetter();

      log('Length ----- ${response.toString()}');

      if (response != null && response['success'] == true) {
        // Parse JSON → Immutable Model
        final apiResponse = ApiResponse.fromJson(response['data']);
        // Access data (immutable!)
        final foodCategory = apiResponse.categories?.food;
        final beveragesCategory = apiResponse.categories?.beverages;
        final eventsCategory = apiResponse.categories?.events;

        foodItems = foodCategory?.items ?? [];
        beveragesItems = beveragesCategory?.items ?? [];
        eventsItems = eventsCategory?.items ?? [];

        log('Length ----- ${foodItems.length.toString()}');
      }
      isLoading.value = false;
      update();
      log(response.toString());
    } catch (e) {
      isLoading.value = false;

      log(e.toString());
    }
  }
}
