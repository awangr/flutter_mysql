import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:using_db/api_connect/api_connect.dart';
import 'package:using_db/users/models/users_model.dart';

class UsersC extends GetxController {
  final usernameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  RxBool isVisible = true.obs;
  validateEmail() async {
    try {
      var res = await http.post(Uri.parse(ApiConnect.validateEmail),
          body: {'email': emailC.text.trim()});
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        if (body['emailfound'] == true) {
          Fluttertoast.showToast(msg: 'Email is already');
        } else {
          registerAndSveUserRecord();
        }
      }
    } catch (e) {
      print('Errror $e');
      Fluttertoast.showToast(msg: 'Gagal');
    }
  }

  registerAndSveUserRecord() async {
    UsersModel usersModel = UsersModel(
        1, usernameC.text.trim(), emailC.text.trim(), passC.text.trim());
    try {
      var res = await http.post(
          Uri.parse(
            ApiConnect.sigUp,
          ),
          body: usersModel.toJson());
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        if (body['success'] == true) {
          Fluttertoast.showToast(msg: 'You are sigup is success');
          usernameC.clear();
          emailC.clear();
          passC.clear();
        } else {
          Fluttertoast.showToast(msg: 'Error, try again');
        }
        ;
      }
    } catch (e) {
      print('error $e');
      Fluttertoast.showToast(msg: 'Gagal');
    }
  }
}
