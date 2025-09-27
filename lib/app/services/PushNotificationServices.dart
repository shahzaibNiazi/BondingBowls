// import 'dart:developer';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
// import 'package:obo/app/config/global_var.dart';
// import 'package:obo/app/routes/app_pages.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'LocalNotificationHandler.dart';
//
// class FirebasePushNotificationHandler extends GetxService {
//   late SharedPreferences pref;
//   late FirebaseMessaging firebaseMessaging;
//
//   @override
//   void onInit() {
//     // heads = Get.arguments;
//     //
//     firebaseMessaging = firebaseMessaging = FirebaseMessaging.instance;
//     super.onInit();
//   }
//
//   // final VideosRepository _repository = VideosRepository();
//   setUpFirebasePushNotification() async {
//     log('FirebasePushNotificationHandler.setUpFirebasePushNotification');
//     LocalNotificationHandler local = LocalNotificationHandler();
//     Get.log(
//         '[FirebasePushNotificationHandler.setUpFirebasePushNotification] called ');
//     FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     Get.log(
//         '[FirebasePushNotificationHandler.requestPermission] called ${settings.authorizationStatus}   ');
//     // NotificationSettings settings = await _firebaseMessaging.requestPermission(
//     //   alert: true,
//     //   announcement: false,
//     //   badge: true,
//     //   carPlay: false,
//     //   criticalAlert: false,
//     //   provisional: false,
//     //   sound: true,
//     // );
//     pref = await SharedPreferences.getInstance();
//     String? token = await firebaseMessaging.getToken();
//     Globals.fcmToken = token!;
//     pref.setString("fcmToken", token);
//     log("fcmToken : $token");
//     setupInteractedMessage();
//     // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     FirebaseMessaging.onMessage.listen((event) {
//       Get.log('[FirebasePushNotificationHandler.onMessage] Listening  ${event.data}');
//       RemoteNotification? notification = event.notification;
//
//       if (Get.currentRoute != '/conversation') {
//         local.initilizeLocalNotification().then((value) {
//           local.displayLocalNotification(notification!, event.data);
//         });
//       }
//
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       log('[FirebasePushNotificationHandler.onMessageOpenedApp] Listening called ');
//       log(event.data.toString());
//       RemoteNotification? notification = event.notification;
//       local.initilizeLocalNotification().then((value) {
//         local.displayLocalNotification(notification!, event.data);
//       });
//       if (event.data["type"] == "new_message") {
//         Get.toNamed(Routes.CONVERSATION);
//       }
//     });
//   }
//
//   Future<void> getFcmToken() async {
//     pref = await SharedPreferences.getInstance();
//     String? token = await firebaseMessaging.getToken();
//     Globals.fcmToken = token!;
//     log("Global Token --------------------------${Globals.fcmToken}");
//     log("Token -----------------------$token");
//     pref.setString("fcmToken", token);
//   }
//
//   Future<void> setupInteractedMessage() async {
//     Get.log('[FirebasePushNotificationHandler.setupInteractedMessage] called ');
//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//     await FirebaseMessaging.instance.getInitialMessage();
//
//     // If the message also contains a data property with a "type" of "chat",
//     // navigate to a chat screen
//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }
//   }
//
//   void _handleMessage(RemoteMessage message) {
//     log('[FirebasePushNotificationHandler._handleMessage] called ${message.data}');
//     // if (Get.currentRoute != Routes.CHAT) {
//     //   if (message.data['type'] == 'new_message') {
//     //     Get.toNamed(
//     //       Routes.CHAT,
//     //       arguments: [int.parse(message.data['conversation_id']), false],
//     //     );
//     //   }
//     }
//     // Config.fromNotification = true;
//     // Get.offAll(() => const Notifications());
//
//     // print("CONVERTING FROM NOTIFICATION VALUE TO ${Config.fromNotification}");
// /*    if (message.data['eventId'] == "0") {
//       print("this is my message ${message.data}");
//       Get.toNamed(Routes.NOTIFICATIONS);
//     } else if (message.data['eventId'] == "1") {
//       Get.log('[FirebasePushNotificationHandler._handleMessage] called 1');
//       Get.to(() => ForeignProfilePageView(), arguments: message.data['userid']);
//     } else if (message.data['eventId'] == "2") {
//       Get.log('[FirebasePushNotificationHandler._handleMessage] called 2');
//       getVideoById(int.parse(message.data['objectId']));
//     } else if (message.data['eventId'] == "3") {
//       Get.log('[FirebasePushNotificationHandler._handleMessage] called 3');
//       getVideoById(int.parse(message.data['objectId']));
//     } else if (message.data['eventId'] == "4") {
//       Get.log('[FirebasePushNotificationHandler._handleMessage] called 4');
//       getVideoById(int.parse(message.data['objectId']));
//     } else if (message.data['eventId'] == "5") {
//       Get.log('[FirebasePushNotificationHandler._handleMessage] called 5');
//       Get.toNamed(Routes.MESSAGES);
//     }*/
//   }
//
//
// @pragma("vm:entry-point")
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   Get.log('[_firebaseMessagingBackgroundHandler] called ');
//   await Firebase.initializeApp();
//   log("Handling a background message: ${message.data}");
//   // if (Get.currentRoute != Routes.CHAT) {
//   //   if (message.data['type'] == 'new_message') {
//   //     Get.toNamed(
//   //       Routes.CHAT,
//   //       arguments: [int.parse(message.data['conversation_id']), false],
//   //     );
//   //   }
//   // }
// }
//
