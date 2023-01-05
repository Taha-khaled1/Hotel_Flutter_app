import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/UI/chat/chat_component.dart';
import 'package:hotelbooking/UI/chat/compose_screen.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({Key? key});

  @override
  Widget build(BuildContext context) {
    //  final ScaffoldKey = GlobalKey<ScaffoldKey>();
    // var controller = Get.put(HomeChatController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(ComposeScreen(), transition: Transition.rightToLeft);
          },
          backgroundColor: Color(0xFF928CEF),
          child: const Icon(Icons.edit),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Chats",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: chatsComponent());
  }
}
