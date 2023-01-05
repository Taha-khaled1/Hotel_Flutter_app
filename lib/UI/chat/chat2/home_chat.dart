import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/UI/chat/chat2/chat_Room.dart';

class HomeChat2 extends StatefulWidget {
  const HomeChat2({Key? key}) : super(key: key);

  @override
  State<HomeChat2> createState() => _HomeChat2State();
}

class _HomeChat2State extends State<HomeChat2> {
  late Map<String, dynamic> userMap;
  bool isLoding = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoding = true;
    });

    await _firestore
        .collection("user")
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoding = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("chats"),
        centerTitle: true,
      ),
      body: isLoding
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 5,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(onPressed: onSearch, child: Text("Search")),
                SizedBox(
                  height: 15,
                ),
                // ignore: unnecessary_null_comparison
                userMap == null
                    ? ListTile(
                        onTap: () {
                          String roomId = chatRoomId(
                              _auth.currentUser!.displayName!, userMap["name"]);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                  chatRoomId: roomId, userMap: userMap),
                            ),
                          );
                        },
                        title: Text(userMap["name"]),
                        subtitle: Text(userMap["email"]),
                      )
                    : Container()
              ],
            ),
    );
  }
}
