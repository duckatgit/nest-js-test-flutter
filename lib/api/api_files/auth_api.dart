import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/storage_manager/key_constant.dart';
import 'package:to_do_app/storage_manager/storage_manager.dart';

import '../../main.dart';
import '../api_handler/api_handler.dart';
import '../api_urls/api_urls.dart';

Future<bool> authenticationAPI({
  required String email,
  required String password,
  required bool isLogin,
}) async {
  try {
    final params = {
      "email": email,
      "password": password,
    };
    var response = await ApiHandler().post(
      url: isLogin ? ApiUrl.login : ApiUrl.signup,
      queryParameters: params,
    );
    var data = jsonDecode(response);
    log("data: $data");
    await StorageManager.saveData(KeyConstant.uid, data['uid']);
    await StorageManager.saveData(KeyConstant.email, data['user']);
    return true;
  } catch (e) {
    log('Error: $e');
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
    return false;
  }
}
