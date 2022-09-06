import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/app/utils/theme.dart';

class KategoriView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.width / 2.2.w,
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: Text(
              "Mobile App Design",
              style: BlackText,
            ),
          ),
          const SizedBox(
              height: 2.0,
          ),
           Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: Text(
              "10 Task",
              style: GreyText,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            height: 50,
            width: double.infinity,
            child: Lottie.asset("assets/lottie/robot.json", fit: BoxFit.cover)
          )
        ],
      ),
    );
  }
}
