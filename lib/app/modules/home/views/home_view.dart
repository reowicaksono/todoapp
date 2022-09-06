import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/controllers/auth_controller.dart';
import 'package:todoapp/app/modules/widgets/views/kategori_view.dart';
import 'package:todoapp/app/modules/widgets/views/ongoing_view.dart';
import 'package:todoapp/app/utils/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: edge, vertical: 10.0),
      child: ListView(
        children: [
          /// -- HEADER -- ///

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                    text: "HI Reo\n",
                    style: BlackText.copyWith(fontSize: 20),
                    children: [TextSpan(text: "data", style: BlueText)]),
              ),
              Container(
                height: 50,
                width: 50,
                child: CircleAvatar(),
              )
            ],
          ),

          const SizedBox(
            height: 20.0,
          ),

          /// -- BODY -- ///

          // Pencarian
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - (6 * edge),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Search any query",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0))),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      50.0,
                    ),
                  ),
                ),
                child: Icon(Icons.filter),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),

          // Kategori
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kategori",
                style: BlackText.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: BlueText.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                KategoriView(),
                const SizedBox(
                  width: 20.0,
                ),
                KategoriView(),
                const SizedBox(
                  width: 20.0,
                ),
                KategoriView()
              ],
            ),
          ),

          //On Going Task
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "On Going Task",
                style: BlackText.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: BlueText.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),

           Container(
            height: Get.height,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index) => (index % 2 ==0 )? OngoingView(WarnaBiru) : OngoingView(Colors.red))
          ),

          /// -- FOOTER -- ///
        ],
      ),
    )));
  }
}
