import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../config/global_var.dart';

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._internal();

  factory DeviceInfoService() => _instance;

  DeviceInfoService._internal();

  Future<void> initialize() async {
    // Get FCM token

    // Ensure APNS token is set (For iOS)
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken == null) {
        log('APNS Token is not yet available');
        return; // Exit early to avoid calling getToken() prematurely
      } else {
        log('APNS Token: $apnsToken');
      }
    }

     Globals.fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    log('inside initDeviceInfo function');
    // Get device information
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var info = await deviceInfo.deviceInfo;
    if (info is AndroidDeviceInfo) {
      Globals.deviceId = info.id;
      Globals.deviceName = info.model;
      // Globals.loginDevice = "Android";
    } else if (info is IosDeviceInfo) {
      Globals.deviceId = info.identifierForVendor;
      Globals.deviceName = info.utsname.machine;
      // Globals.loginDevice = "iOS";
    }

    // Get app version and build number
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Globals.appVersion = packageInfo.version;
    Globals.buildNumber = packageInfo.buildNumber;
    Globals.loginDevice = Platform.operatingSystem;
    log('fcm token: ${Globals.fcmToken}');
    log('deviceId: ${Globals.deviceId}');
    log('deviceName: ${Globals.deviceName}');
    log('loginDevice: ${Globals.loginDevice}');
    log('appVersion: ${Globals.appVersion}');
    log('buildNumber: ${Globals.buildNumber}');
  }
}
