import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoapp/app/modules/allnotes/views/speech_totext_view.dart';

import '../../../utils/theme.dart';
import '../controllers/allnotes_controller.dart';

class AllnotesView extends GetView<AllnotesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => Get.to(SpeechTotextView()),child: Icon(Icons.add),),
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("All Notes", style: BlackText),
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: edge, vertical: edge),
          child: ListView.builder(
            itemBuilder: (contex, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: WarnaBiru)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lorem Ipsum",
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: BlackText.copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non lorem ut enim fermentum malesuada. Aliquam ultricies, ipsum vitae ultrices convallis, lorem diam accumsan nunc,",
                                textAlign: TextAlign.justify,
                                maxLines: 3,overflow: TextOverflow.ellipsis,
                                style: GreyText.copyWith(
                                    color: Color.fromARGB(255, 191, 196, 199)),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Text("6/10/2022",
                                      style: GreyText.copyWith(
                                          color:
                                              Color.fromARGB(255, 191, 196, 199))),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            },
            itemCount: 10,
          ),
        )));
  }
}
