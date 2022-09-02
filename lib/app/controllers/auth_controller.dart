import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference referenceUser =
      FirebaseFirestore.instance.collection("users");

  //logic introduction
  bool isstarted = false;

  //Method Login
  void login(String email, String pass) async {
    auth.signOut();
    if (email.isNotEmpty && pass.isNotEmpty) {
      try {
        final UserCredential credential =
            await auth.signInWithEmailAndPassword(email: email, password: pass);
        if (credential.user!.emailVerified != false) {
          Get.offAllNamed(Routes.HOME);
          Get.snackbar("Success", "Login Berhasil");
        } else {
          Get.defaultDialog(
              title: "Login Gagal",
              middleText: "Anda Harus Verifikasi Email Terlebih Dahulu",
              onConfirm: () => credential.user!.sendEmailVerification());
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

  //Register controller
  void register(String nama, String email, String pass, String nohp) async {
    if (nama.isNotEmpty &&
        email.isNotEmpty &&
        pass.isNotEmpty &&
        nohp.isNotEmpty) {
      try {
        final UserCredential credential = await auth
            .createUserWithEmailAndPassword(email: email, password: pass);
        if (credential.user != null) {
          String? uid = credential.user?.uid;
          referenceUser.doc(uid).set({
            'nama': nama,
            'email': email,
            'nohp': nohp,
          });
          credential.user!.sendEmailVerification();
          Get.offAllNamed(Routes.HOME);
          Get.snackbar('Success',
              'Please check your mail or spam in your gmail for validation!!');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      Get.snackbar('Error', 'Please fill the form!!!');
    }
  }

  //Logout Controller
  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  //Getter User Current Data
  Stream<User?> get streamuser => auth.authStateChanges();
}
