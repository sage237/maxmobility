import 'package:assign_maxmobility/db_helper.dart';
import 'package:get/get.dart';

import 'user_modal.dart';

class HomePageController extends GetxController {
  RxList<User> users = <User>[].obs;
  RxBool isloading = true.obs;
  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    final lst = await SQLHelper.getAllUsers();
    users.clear();
    for (var element in lst) {
      users.add(User.fromJson(element));
    }
    if (users.isNotEmpty) print('Users. ${users.first.membername}');
    users.refresh();
    isloading(false);
  }
}
