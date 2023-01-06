import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/UI/chat/chat2/chat_Room.dart';

import 'chat_screen.dart';

class ComposeScreen extends StatelessWidget {
  ComposeScreen({Key? key}) : super(key: key);
  chatRoomId(
    String user1,
    String user2,
  ) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  Map<String, dynamic> userMap = Map();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
        backgroundColor: Color(0xFF928CEF),
        appBar: AppBar(
          centerTitle: true,
          title: Text("New Message"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("user")
                    .where(
                      "name",
                    )
                    .snapshots(),
                builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return Center(child: Text('Loading'));
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot posts = snapshot.data!.docs[index];
                            return Container(
                              child: InkWell(
                                onTap: () {
                                  String roomId = chatRoomId(
                                      _auth.currentUser!.displayName!,
                                      userMap["name"] ?? 'as');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatRoom(
                                        chatRoomId: roomId,
                                        userMap: userMap,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 120,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 30,
                                          child: Material(
                                            child: Container(
                                              height: 90,
                                              width: 350,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      offset:
                                                          Offset(-10.0, 10.0),
                                                      blurRadius: 20,
                                                      spreadRadius: 4.0,
                                                    )
                                                  ]),
                                            ),
                                          )),
                                      Positioned(
                                        top: 50,
                                        left: 15,
                                        child: Card(
                                          elevation: 0,
                                          // shadowColor:
                                          //     Colors.grey.withOpacity(0.5),
                                          // shape: RoundedRectangleBorder(
                                          //   borderRadius:
                                          //       BorderRadius.circular(15.0),
                                          // ),
                                          // child: CircleAvatar(
                                          //     backgroundColor: Colors.white,
                                          //     radius: 33,
                                          //     child: Image.asset(
                                          //       "assets/image/profile/profile.png",
                                          //       fit: BoxFit.cover,
                                          //     ))
                                          // Container(
                                          //   height: 80,
                                          //   width: 70,
                                          //   decoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(10.0),
                                          //       image: DecorationImage(
                                          //           fit: BoxFit.fill,
                                          //           image: AssetImage(
                                          //             "assets/image/profile/profile.png",
                                          //           ))),
                                          // ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 70,
                                          left: 90,
                                          child: Container(
                                            height: 120,
                                            width: 180,
                                            child: Column(children: [
                                              Text(
                                                posts["name"],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // Divider(
                                              //   color: Colors.black,
                                              // ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                posts["email"],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ]),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                  }
                }))));
  }
}
