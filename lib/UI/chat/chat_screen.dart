import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final Map<String, dynamic> userMap;
  final String chatRoomId;

  ChatScreen({super.key, required this.userMap, required this.chatRoomId});
  //final String? user;
  //const ChatScreen({Key? key, required this.user}) : super(key: key);
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var controller = Get.put(ChatController());
    return Scaffold(
      backgroundColor: Color(0xFF928CEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                        text: "",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))
                  ])))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Directionality(
                      textDirection:
                          index.isEven ? TextDirection.ltr : TextDirection.rtl,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: index.isEven
                                  ? Color.fromARGB(255, 12, 48, 77)
                                  : Colors.grey,
                              // child: Image.asset(
                              //   "assets/image/profile/profile.png",
                              //   color: Color.fromARGB(255, 255, 255, 255),
                              // ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: StreamBuilder<QuerySnapshot>(builder:
                                  ((BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: ((context, index) {
                                        return Text(snapshot.data!.docs[index]
                                            ["message"]);
                                      }));
                                } else {
                                  return Container();
                                }
                              })),
                            ),
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? Color.fromARGB(255, 123, 62, 220)
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "Hello this is a mahmoud test message",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                "11.08 AM",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 55,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        //color: Colors.grey,
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      controller: _message,
                      maxLines: 1,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "type your message",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            //  color: Colors.white,
                          )),
                    ),
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 123, 62, 220),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
