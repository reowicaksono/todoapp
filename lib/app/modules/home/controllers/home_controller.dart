import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get streamuser => auth.authStateChanges();

  void logout() async{
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
