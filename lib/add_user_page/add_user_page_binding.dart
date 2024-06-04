
import 'package:get/get.dart';

import 'add_user_page_controller.dart';

class AddUserPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AddUserPageController());
  }
}