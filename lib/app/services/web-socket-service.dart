// import 'dart:convert';
// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:obo/app/config/global_var.dart';
// import 'package:obo/data/model/chat_model.dart';
// import 'package:obo/data/model/comment-model.dart';
// import 'package:obo/presentation/Chapter-Flow/chapterAddPost/controllers/chapter_add_post_controller.dart';
// import 'package:obo/presentation/conversation/controllers/conversation_controller.dart';
// import 'package:obo/presentation/home/controllers/home_controller.dart';
// import 'package:web_socket_client/web_socket_client.dart';
//
// class WebSocketService {
//   static final WebSocketService _instance = WebSocketService._internal();
//
//   factory WebSocketService() {
//     return _instance;
//   }
//
//   WebSocketService._internal();
//   WebSocket? socket;
//
//   void initializeSocket(Uri uri, Backoff backoff) async {
//     log("Socket Inititaliaze");
//     if (socket == null) {
//       log("Socket is not null");
//       final headers = {
//         'Authorization': 'Bearer ${Globals.authToken}',
//         'Content-type': 'application/json',
//         'Accept': 'application/json',
//       };
//
//       log('Headers============${headers}');
//
//       socket = WebSocket(uri, backoff: backoff, headers: headers);
//
//       log('--------------Websocket${socket.toString()}');
//
//       setupSocketListener();
//     }
//   }
//
//
//   void disconnect(){
//     socket!.close();
//     socket=null;
//   }
//
//
//   void setupSocketListener() {
//     log("Socket is going to listen");
//
//     // if (socket != null && socket!.messages.isBroadcast == false) {
//     log("Socket is listened");
//     socket!.messages.listen((message) {
//       try{
//         log("socketMessage1: $message");
//         final onData = jsonDecode(message);
//         log("onData: $onData");
//           if(onData['type'] == 'all_comments'){
//
//             List<CommentData> comments = (onData['comments'] as List)
//                 .map((comment) => CommentData.fromJson(comment))
//                 .toList();
//             // List<MessageModel> messages = (onData['data']['meeting_messages'] as List)
//             //     .map((notification) => MessageModel.fromJson(notification))
//             //     .toList();
//
//             if(comments.isNotEmpty){
//
//               if(Get.isRegistered<HomeController>()){
//                 Get.find<HomeController>().comments.clear();
//               }else if(Get.isRegistered<ChapterAddPostController>()){
//                 Get.find<ChapterAddPostController>().comments.clear();
//               }
//
//               log('comments length: ${comments.length}');
//               if(Get.isRegistered<HomeController>()){
//                 Get.find<HomeController>().comments.addAll(comments);
//                 Get.find<HomeController>().update();
//               } else if(Get.isRegistered<ChapterAddPostController>()){
//                 Get.find<ChapterAddPostController>().comments.addAll(comments);
//                 Get.find<ChapterAddPostController>().update();
//
//               }
//             }
//             // if(messages.isNotEmpty){
//             //   if(Get.isRegistered<MeetingRoomController>()){
//             //     Get.find<MeetingRoomController>().meetingMessages.addAll(messages);
//             //     // Get.find<MeetingRoomController>().scrollToEnd();
//             //     Get.find<MeetingRoomController>().update();
//             //   }
//             //
//             // }
//           }else if(onData['type'] == 'forum_post_comment'){
//             if(onData['forum_post_comment']!=null){
//               CommentData comment =CommentData.fromJson(onData['forum_post_comment']);
//               if(Get.isRegistered<HomeController>()){
//                 Get.find<HomeController>().comments.add(comment);
//                 Get.find<HomeController>().scrollToEnd();
//                 Get.find<HomeController>().update();
//               } else if(Get.isRegistered<ChapterAddPostController>()){
//                 Get.find<ChapterAddPostController>().comments.add(comment);
//                 Get.find<ChapterAddPostController>().scrollToEnd();
//                 Get.find<ChapterAddPostController>().update();
//               }
//             }
//           }else if(onData['type'] == 'comment_reply'){
//             if(onData['comment_reply']!=null){
//               ReplyData reply =ReplyData.fromJson(onData['comment_reply']);
//
//               if(Get.isRegistered<HomeController>()){
//                 CommentData? commentData=Get.find<HomeController>().comments.firstWhereOrNull((c)=>c.id==reply.comment);
//                 if(commentData!=null){
//                   commentData.replies ??= [];
//                   commentData.replies!.add(reply);
//                   Get.find<HomeController>().scrollToEnd();
//                   Get.find<HomeController>().update();
//                 }
//               } else if(Get.isRegistered<ChapterAddPostController>()){
//                 CommentData? commentData=Get.find<ChapterAddPostController>().comments.firstWhereOrNull((c)=>c.id==reply.comment);
//                 if(commentData!=null){
//                   commentData.replies ??= [];
//                   commentData.replies!.add(reply);
//                   Get.find<ChapterAddPostController>().scrollToEnd();
//                   Get.find<ChapterAddPostController>().update();
//                 }
//               }
//             }
//
//           }else if(onData['type'] == 'new_message'){
//             if(Get.isRegistered<ConversationController>()){
//               Get.find<ConversationController>().chatMessages.insert(0,ChatMessageModel.fromJson(onData['message']));
//               Get.find<ConversationController>().update();
//             }
//           }
//
//       }catch(e,s){
//         log("error in parsing socket response $e, $s");
//       }
//
//
//     });
//   }
// }
