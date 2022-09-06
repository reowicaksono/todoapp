import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/utils/theme.dart';

import '../controllers/allnotes_controller.dart';

class SpeechTotextView extends GetView<AllnotesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpeechTotextView'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    controller.awal.value,
                    style: BlackText.copyWith(fontSize: 30),
                    textAlign: TextAlign.justify,
                  )),
            ],
          ),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => AvatarGlow(
          animate: controller.isListening.value,
          glowColor: Colors.blue,
          endRadius: 90.0,
          repeat: true,
          repeatPauseDuration: Duration(milliseconds: 1000),
          duration: Duration(milliseconds: 2000),
          child: FloatingActionButton(
            onPressed: () => controller.listen,
            child:
                Icon(controller.isListening.value ? Icons.mic : Icons.mic_none),
          ))),
    );
  }
}
