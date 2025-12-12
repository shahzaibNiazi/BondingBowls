import 'package:get/get.dart';

class SystemChatController extends GetxController {
  //TODO: Implement SystemChatController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  var messages = <Map<String, String>>[
    {"sender": "SysTaco", "text": "What is my purpose?"},
    {"sender": "voucherlover69", "text": "You pass food vouchers."},
    {"sender": "SysTaco", "text": "Oh my God."},
    {"sender": "voucherlover69", "text": "Yeah, welcome to the club, pal."},
  ].obs;

  var deals = {
    "title": "Flash Bowl Deals! [Time limited offer]",
    "description":
        "Enjoy Everything 20% @ Macdonalds\n\nExpires Until shop closes for today.\nMatch in cafeconnect to get the deals\nClick here for more info!",
    "time": "1:34pm",
  }.obs;

  void increment() => count.value++;
}
