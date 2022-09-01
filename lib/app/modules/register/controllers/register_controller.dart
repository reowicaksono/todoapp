import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nohpController = TextEditingController();
  TextEditingController passController = TextEditingController();
  //Methode Close & Init
  @override
  void onInit() {
    namaController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaController.dispose();
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
