import 'package:get/get.dart';

import '../controllers/allnotes_controller.dart';

class AllnotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllnotesController>(
      () => AllnotesController(),
    );
  }
}
