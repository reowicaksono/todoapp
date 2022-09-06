import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/app/controllers/auth_controller.dart';
import 'package:todoapp/app/routes/app_pages.dart';

//routes
import 'package:todoapp/app/utils/theme.dart';

class IntroductionView extends GetView {
  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController(),permanent: true);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(24.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- HEADER ------ \\\
              Text.rich(
                TextSpan(
                    text: "Manager your \nteam & everything \nwith ",
                    style: BlackText.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "Todo App",
                        style: BlueText.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
              SizedBox(
                height: 20.0.h,
              ),

              // ---- BODY ------ \\\

              Container(
                height: 250.h,
                width: double.infinity.w,
                child: Lottie.asset("assets/lottie/welcome.json"),
              ),
              Text(
                  "When you're overwhelmed by the \namount of work, you have on your \nplate,stop and nethink",
                  style: BlackText),

              SizedBox(
                height: 50.0.h,
              ),

              // ---- FOOTER ------ \\\

              Center(
                child: Container(
                  height: 50,
                  width: Get.width - (6 * edge),
                  child: ElevatedButton(
                    onPressed: () {
                      auth.isstarted = !false;
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: Text("Let's start"),
                    style: ElevatedButton.styleFrom(
                        primary: WarnaBiru,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
