import 'package:get/get.dart';
import 'package:hotelbooking/UI/chat/services/firebease_const.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeChatController extends GetxController {
  late SharedPreferences prefs;
  static HomeChatController instance = Get.find();
  getUserDetails() async {
    await firebaseFirestore
        .collection(collectionUser)
        .where("id", isEqualTo: currentUser!.uid)
        .get()
        .then((value) async {
      prefs = await SharedPreferences.getInstance();
      prefs.setStringList(
          "user", [value.docs[0]["name"], value.docs[0]["email"]]);
    });
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }
}
