import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotelbooking/UI/Bottom_Nav_Bar/bottomNavBar.dart';
import 'package:hotelbooking/UI/chat/controller/user_controller.dart';
import 'package:hotelbooking/UI/chat/services/firestore_user.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name, city, country, phone;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  //final LocalStorgeData localStorgeData = Get.find();
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithEmailAndPassword() async {
    final box = GetStorage();
    //  String name1=box.read('name')??"";
    String email1 = box.read('email') ?? "";

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(BottomNavBar());
    } catch (e) {
      print(e.toString());
      Get.snackbar("Erorr login account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    final box = GetStorage();
    //  String name1=box.read('name')??"";
    String email1 = box.read('email') ?? "";

    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        box.write('email', email);
        box.write('name', name);

        UserModel userModel =
            UserModel(email, name, user.user!.uid, phone, city, country);
        await FireStoreUser().addUserToFireStore(
            UserModel(email, name, user.user!.uid, phone, city, country));
      });
      Get.offAll(BottomNavBar());
    } catch (e) {
      print(e.toString());
      Get.snackbar("Erorr login account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
