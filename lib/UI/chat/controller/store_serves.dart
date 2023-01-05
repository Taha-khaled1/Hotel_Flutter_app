import 'package:hotelbooking/UI/chat/services/firebease_const.dart';

class StoreSerives {
  static getUser(String id) {
    return firebaseFirestore.collection(collectionUser).where("id").get();
  }

  static getAllUsers() {
    return firebaseFirestore.collection(collectionUser).snapshots();
  }
}
