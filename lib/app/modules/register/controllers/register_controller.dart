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

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference referenceUser = FirebaseFirestore.instance.collection("users");

  //Method Register
  void register() async {
    if (namaController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty) {
      try {
        final UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        if(credential.user != null){
          String? uid = credential.user?.uid;
          referenceUser.doc(uid).set({
            "nama" : namaController.text,
            "email" : emailController.text,
            "nohp" : nohpController.text,
          });
          credential.user!.sendEmailVerification();
          Get.offAllNamed(Routes.HOME);
          Get.snackbar("Success", "Berhasil mendaftarkan akun!!");

        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      Get.snackbar("Error", "Form wajib di isi semua!!!");
    }
  }

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
