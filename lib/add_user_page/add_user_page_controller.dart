import 'dart:developer';
import 'dart:io';

import 'package:assign_maxmobility/db_helper.dart';
import 'package:assign_maxmobility/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddUserPageController extends GetxController {
  final userLoginFormKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final usermobille = TextEditingController();
  final useremail = TextEditingController();
  final address = TextEditingController();
  final userlat = TextEditingController();
  final userlong = TextEditingController();
  final img = TextEditingController();

  RxBool isloading = false.obs;

  Future<void> addUser() async {
    isloading(true);
    try {
      await SQLHelper.addUsers(
          name: username.text,
          mobile: usermobille.text,
          email: useremail.text,
          address: address.text,
          lat: userlat.text,
          long: userlong.text,
          image: imageFile.value!);
      HomePageController controller = Get.find();
      controller.getUsers();
      isloading(false);
      Get.dialog(AlertDialog(
        title: Text('Success'),
        content: Text('Customer Added Successfully'),
        actions: [
          TextButton(
              onPressed: () {
                username.clear();
                usermobille.clear();
                useremail.clear();
                address.clear();
                userlat.clear();
                userlong.clear();
                img.clear();
                imageFile.value = null;
              },
              child: Text('New Entry')),
          TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: Text('Done')),
        ],
      ));
    } catch (e) {
      log('Exception while add $e');
    }
  }

  var imageFile = Rxn<File>();
  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final fle = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
      if (fle != null) {
        imageFile.value = File(fle.path);
      }

      img.text = image.path.split('/').last;
      print('aaaaaaaaaaaaaaaaaa ${img.text}');
    }
  }
}
