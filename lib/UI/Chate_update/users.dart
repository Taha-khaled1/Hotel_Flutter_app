import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/handling.dart';
import 'package:hotelbooking/ShardFunction/statusrequst.dart';
import 'package:hotelbooking/UI/Chate_update/Chat_room.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/data/functions_response/get_cities.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UsersModels? helpModel;
  late StatusRequest statusRequest;
  getdataUser() async {
    statusRequest = StatusRequest.loading;
    setState(() {});
    var response = await getUsersRespon();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      helpModel = await UsersModels.fromJson(response);
    } else {
      print('erorr');
    }
    setState(() {});
  }

  @override
  void initState() {
    getdataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserScreen'),
      ),
      body: HandlingDataView(
        statusRequest: statusRequest,
        widget: ListView.builder(
          itemCount: helpModel?.message!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: ListTile(
                  onTap: () {
                    Get.to(ChatPage(
                      peerId: helpModel!.message![index].sId!,
                      username: helpModel!.message![index].username!,
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xff6ae792),
                    child: Image.asset(
                      'assets/images/imagenot.jpg',
                    ),
                  ),
                  title: Text(
                    helpModel?.message![index].username ?? 'username',
                  ),
                  subtitle: Text('0128896454'),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
