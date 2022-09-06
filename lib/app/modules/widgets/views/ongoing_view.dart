import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/app/routes/app_pages.dart';

import '../../../utils/theme.dart';

class OngoingView extends GetView {
  late Color newColor;
  OngoingView(Color color) {
    this.newColor = color;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ALLNOTES),
      child: Container(
        height: Get.height / 5.h,
        width: Get.width / 2.2.w,
        decoration: BoxDecoration(
          color: newColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: Text(
                    "Mobile App Design",
                    style: WhiteText,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                  child: Text(
                    "3 days",
                    style: WhiteText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non lorem ut enim fermentum malesuada. Aliquam ultricies, ipsum vitae ultrices convallis, lorem diam accumsan nunc,", overflow: TextOverflow.ellipsis,maxLines: 2,
                style: GreyText.copyWith(color: Color.fromARGB(255, 191, 196, 199)),
              ),
            ),
            Spacer(),
            Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mobile Development",
                  style: WhiteText,
                ),
                Text(
                  "10/6/2022",
                  style: WhiteText,
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
