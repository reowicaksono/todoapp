import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/modules/home/controllers/home_controller.dart';

import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  final auth = Get.put(AuthController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.streamuser,
      builder: (context, snapshot) {
       if(snapshot.connectionState == ConnectionState.active ){
         return GetMaterialApp(
          title: "Application",
          initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
          getPages: AppPages.routes,
        );
       }else{
        return CircularProgressIndicator();
       }
      }
    );
  }
}
