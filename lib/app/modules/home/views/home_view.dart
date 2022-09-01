import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => auth.logout(), icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.getUSer(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listData = snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return ListTile();
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )));
  }
}
