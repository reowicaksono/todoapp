import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  //Method Login
  void login() async {
    auth.signOut();
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      try {
        final UserCredential credential = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        if (credential.user!.emailVerified != false) {
          Get.offAllNamed(Routes.HOME);
          Get.snackbar("Success", "Login Berhasil");
        }else{
          Get.defaultDialog(
            title: "Login Gagal",
            middleText: "Anda Harus Verifikasi Email Terlebih Dahulu",
            onConfirm: () => credential.user!.sendEmailVerification()
          );
        }
        print(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Error", "No user found for that email.");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error", "Wrong password provided for that user.");
        }
      }
    } else {
      Get.snackbar("Error", "Form wajib di isi semua");
    }
  }

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
