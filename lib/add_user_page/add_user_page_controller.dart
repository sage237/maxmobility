import 'dart:developer';

import 'package:assign_maxmobility/db_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserPageController extends GetxController {
  final userLoginFormKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final usermobille = TextEditingController();
  final useremail = TextEditingController();
  final userlat = TextEditingController();
  final userlong = TextEditingController();
  final img = TextEditingController();



  RxBool isloading = false.obs;

  Future<void> addUser() async {
    isloading(true);
    try{
     await SQLHelper.addUsers(name: username.text, mobile: usermobille.text, email: useremail.text, lat: userlat.text, long: userlong.text);
    }catch(e){
      log('Exception while add $e');
    }
    isloading(false);
  }
var imageFile=Rxn<XFile>();
  pickImage() async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image!=null){
      imageFile.value=image;
      img.text=image.path.split('/').last;
      print('aaaaaaaaaaaaaaaaaa ${img.text}');

    }

  }
}
