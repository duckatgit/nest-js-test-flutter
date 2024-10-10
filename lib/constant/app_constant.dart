import 'dart:developer';

import '../storage_manager/key_constant.dart';
import '../storage_manager/storage_manager.dart';

class AppConstant {
  static String email = '';
  static String uid = '';

  Future getUserData() async {
    uid = await StorageManager.readData(KeyConstant.uid) ?? '';
    email = await StorageManager.readData(KeyConstant.email) ?? '';
    log("app data: $uid == $email");
  }
}
