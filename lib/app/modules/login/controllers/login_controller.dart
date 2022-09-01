import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //Method Init & Close

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
