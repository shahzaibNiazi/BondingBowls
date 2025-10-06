import 'package:convo_hearts/app.dart';
import 'package:convo_hearts/data/provider/local_storage/local_db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app/utils/device_info_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(LocalDB());
  DeviceInfoService().initialize();
  runApp(App());
}
