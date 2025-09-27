// import 'dart:convert';
// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:obo/app/config/app_colors.dart';
// import 'package:obo/app/shared_widgets/my_text.dart';
// import 'package:sizer/sizer.dart';
// import '../routes/app_pages.dart';
// import '../utils/utils.dart';
//
// class LocalNotificationHandler {
//   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
//   // final VideosRepository _repository = VideosRepository();
//
//   LocalNotificationHandler() {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   }
//
//   Future initilizeLocalNotification() async {
//     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     // final DarwinInitializationSettings initializationSettingsDarwin =
//     //     DarwinInitializationSettings(
//     //         onDidReceiveNotificationResponse: onDidReceiveLocalNotification);
//     final LinuxInitializationSettings initializationSettingsLinux =
//         const LinuxInitializationSettings(
//             defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             // iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);
//     flutterLocalNotificationsPlugin?.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: selectNotification);
//   }
//
//   void selectNotification(NotificationResponse response) async {
//     Get.log(
//         '[LocalNotificationHandler.selectNotification] called ${response.payload}');
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values);
//     // Get.to(() => const Notifications());
//     if (response.payload != null) {
//       var data = jsonDecode(response.payload!);
//       // if (data['eventType'] == "message") {
//       //   var customData = jsonDecode(data['customData']);
//       //   Get.log('LocalNotificationHandler.selectNotification2 ${response.payload}');
//       //
//       //   print("this is my message $response.payload");
//       //   Get.toNamed(Routes.MESSAGE,
//       //       parameters: {"fromScreen":"notification"},
//       //       arguments: Chats(id: data['userid'],
//       //           conversationId: int.parse(customData['conversationId'].toString()),
//       //         photo: customData['photo'],
//       //         fullName: customData['fullName']
//       //       ))?.then((value) {
//       //     if( Get.find<ChatController>().chatList.firstWhereOrNull((element) => element.totalUnseen>0==true)!=null){
//       //       Globals.hasNewMessages =true;
//       //       Get.find<MainController>().update();
//       //     } else {
//       //       Globals.hasNewMessages =false;
//       //       Get.find<MainController>().update();
//       //     }
//       //   });
//       // } else if (data['eventType']  == "invitation") {
//       //   Get.toNamed(Routes.NOTIFICATIONS);
//       // } else if (data['eventId'] == "Follow") {
//       //   Get.to(
//       //           () => UserProfileScreenView(
//       //           isFollow: false,
//       //           isFollower: false,
//       //           specUserId: data['userid'],
//       //           photo: null,
//       //           fullName: "",
//       //           userName: ""),
//       //       arguments: [data['userid'],false]);
//       //       Get.log('[FirebasePushNotificationHandler._handleMessage] called ');
//       //
//       // // } else if (response.payload!.split(":")[1] == "3") {
//       // //   Get.log('[FirebasePushNotificationHandler._handleMessage] called ');
//       // //   getVideoById(int.parse(response.payload!.split(":")[0]));
//       // // } else if (response.payload!.split(":")[1] == "4") {
//       // //   Get.log('[FirebasePushNotificationHandler._handleMessage] called ');
//       // //   getVideoById(int.parse(response.payload!.split(":")[0]));
//       // // } else if (response.payload!.split(":")[1] == "5") {
//       // //   Get.log('[FirebasePushNotificationHandler._handleMessage] called ');
//       // //   Get.toNamed(Routes.MESSAGES);
//       // // }
//       //   }
//     }
//   }
//
// /*  Future getVideoById(int id) async {
//     Map<String, dynamic>? resp;
//     try {
//       resp = await _repository.getVideoById(id);
//     } catch (e) {
//       Get.log('[HomeController.getSavedPlaylistCollection] called ');
//     }
//     if (resp != null && resp['status'] == "Success") {
//       FoodleVideo video = FoodleVideo.fromJson(resp['payload']);
//       Get.toNamed(Routes.PROFILE_VIDEO_PLAYER, arguments: [
//         0,
//         [video]
//       ]);
//     } else if (resp != null && resp['status'] == "Fail") {
//       print("failed");
//       print(resp);
//     } else {}
//   }*/
//
//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     print("jfkgjkfjg");
//
//     Get.log(
//         '[LocalNotificationHandler.onDidReceiveLocalNotification] called $title $body');
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title ?? ""),
//         content: const Text("Grait"),
//         actions: const [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//           )
//         ],
//       ),
//     );
//   }
//
//
//   displayLocalNotification(RemoteNotification remoteNotification, Map<String, dynamic> data) async {
//     dynamic parsedData = data['data'];
//
//     // Parse data if it's a string
//     if (parsedData is String) {
//       try {
//         // Preprocess the string to make it JSON-compatible
//         String jsonString = parsedData
//             .replaceAll("'", '"')
//             .replaceAll('False', 'false') // Replace False with false// Replace single quotes with double quotes
//             .replaceAll('None', 'null'); // Replace None with null
//
//         parsedData = jsonDecode(jsonString);
//       } catch (e) {
//         log('[LocalNotificationHandler] Error decoding data: $e, raw data: $parsedData');
//         return;
//       }
//     }
//
//     // Ensure parsedData is a map
//     if (parsedData is! Map<String, dynamic>) {
//       log('[LocalNotificationHandler] parsedData is not a Map: $parsedData');
//       return;
//     }
//
//     log('[LocalNotificationHandler.displayLocalNotification] called $data');
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//       icon: 'notification_icon', // Ensure this matches the drawable resource
//     );
//     const DarwinNotificationDetails darwinNotificationDetails =
//     DarwinNotificationDetails(
//       categoryIdentifier: "textCategory",
//     );
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: darwinNotificationDetails,
//     );
//     Get.showSnackbar(
//       GetSnackBar(
//         isDismissible: true,
//         duration: const Duration(seconds: 4),
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: AppColors.white,
//         borderRadius: 5,
//         onTap: (details) {
//           // Add your onTap logic here, ensuring safe parsing
//         },
//         margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//         messageText: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 25,
//               backgroundColor: AppColors.black,
//               child: Image.asset(
//                 Utils.getIconPath("logo"),
//                 scale: 4,
//               ),
//             ).paddingOnly(right: 8),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Visibility(
//                     visible: remoteNotification.title != null &&
//                         remoteNotification.title!.isNotEmpty,
//                     child: MyText(
//                       title: remoteNotification.title,
//                       size: 12.sp,
//                       clr: AppColors.black,
//                     ).paddingOnly(bottom: 5),
//                   ).paddingOnly(top: 2, bottom: 2),
//                   data['type'] == 'new_meeting'
//                       ? MyText(
//                     title:
//                     "Shahzaib has scheduled a meeting with you for ${Utils.formatDateUtcToLocal(parsedData['date'], parsedData['time'])}",
//                     size: 10.sp,
//                     clr: AppColors.black,
//                   ).paddingOnly(bottom: 5)
//                       : Visibility(
//                     visible: remoteNotification.body != null &&
//                         remoteNotification.body!.isNotEmpty,
//                     child: MyText(
//                       title: remoteNotification.body,
//                       size: 10.sp,
//                       clr: AppColors.black,
//                     ).paddingOnly(bottom: 5),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }}
