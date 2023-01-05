// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hotelbooking/chat/saved_data.dart';
// import 'package:hotelbooking/services/firebease_const.dart';

// class ChatController extends GetxController {
//   dynamic chatId;
//   var chats = firebaseFirestore.collection(collectionChat);
//   var userId = currentUser!.uid;
//   var friendId = Get.arguments[0];
//   // var username = HomeChatController.instance.prefs.getStringList("user")![0];
//   var friendname = Get.arguments[1];
//   var masseageController = TextEditingController();

//   getChatId() async {
//     await chats
//         .where("user", isEqualTo: {friendId: null, userId: null})
//         .limit(1)
//         .get()
//         .then((QuerySnapshot snapshot) async {
//           if (snapshot.docs.isNotEmpty) {
//             chatId = snapshot.docs.single.id;
//           } else {
//             chats.add({
//               "user": {userId: null, friendId: null},
//               "friend_name": friendname,
//               //  "user_name": username,
//               "toId": "",
//               "fromId": "",
//               "created_on": null,
//               "last_msg": ""
//             }).then((value) {
//               {
//                 chatId = value.id;
//               }
//             });
//           }
//         });
//   }

//   @override
//   void onInit() {
//     getChatId();
//     super.onInit();
//   }
// }
