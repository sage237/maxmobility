import 'package:assign_maxmobility/routes.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController{
  @override
  void onInit() {
   checkIfLoggedIn();
    super.onInit();
  }

  Future<void> checkIfLoggedIn() async {
    await Future.delayed(const Duration(seconds:3));
    Get.offAllNamed(AppRoutes.loginPage);
  }
}