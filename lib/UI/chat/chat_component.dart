import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_screen.dart';

Widget chatsComponent() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Get.to(
                () => ChatScreen(
                  chatRoomId: '', userMap: {},
                  //    user: "name",
                ),
                transition: Transition.downToUp,
                // arguments: ["Username", " User Id"]
              );
            },
            // leading: CircleAvatar(
            //     backgroundColor: Colors.white,
            //     radius: 25,
            //     child: Image.asset(
            //       "assets/image/profile/profile.png",
            //       fit: BoxFit.cover,
            //     )),
            title: Text(
              "Mahmoud Test",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Hello World",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          );
        }),
  );
}
