import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      children: [
        textfieldRegister(
            controllerData: controller.emailController,
            lbl: "Email",
            pass: false),
        const SizedBox(
          height: 20.0,
        ),
       
        textfieldRegister(
            controllerData: controller.passController,
            lbl: "Password",
            pass: true),
        
         const SizedBox(
          height: 20.0,
        ),
        Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.login(),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
              child: Text("Login"),
            )),
      ],
    )));
  }

  // TextField
  TextField textfieldRegister(
      {required TextEditingController controllerData,
      required String lbl,
      required bool pass,
      TextInputType? angkaType}) {
    return TextField(
      keyboardType: angkaType,
      controller: controllerData,
      autocorrect: false,
      obscureText: pass,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text("$lbl"),
      ),
    );
  }
}
