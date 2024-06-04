import 'package:assign_maxmobility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LoginPageController extends GetxController {
  final userLoginFormKey = GlobalKey<FormState>();

  final username = TextEditingController();

  final password = TextEditingController();

  RxBool clickedreg = false.obs;

  RxBool isloading = false.obs;

  Future<void> login() async {
    isloading(true);
    await Future.delayed(const Duration(seconds: 2));
    if (username.text == 'user@maxmobility.in' && password.text == 'Abc@#123') {
      Get.offAllNamed(AppRoutes.homePage);
    } else {
      Get.dialog(
        AlertDialog(
          title:  const Text('Error'),
          content: const Text('Incorrect Username or password'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'))
          ],
        ),
      );
    }
    isloading(false);
  }
}
