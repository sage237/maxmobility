import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../responsive.dart';
import 'add_user_page_controller.dart';

class AddUserPageView extends StatelessWidget {
  AddUserPageView({super.key});

  final AddUserPageController _addUserPageController = Get.find();
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     color: Colors.white,
      //   ),
      //   title: const Text(
      //     "Login",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   elevation: 1,
      // ),
      body: Obx(() {
        return Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation = Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(animation);
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(position: offsetAnimation, child: child),
              );
            },
            child: Form(
                key: _addUserPageController.userLoginFormKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Add Customer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 30),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          controller: _addUserPageController.username,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.text,
                          inputFormatters: [],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                        TextFormField(
                          controller: _addUserPageController.usermobille,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.blue,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              labelText: "Mobile",
                              // labelText: "Password",
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                        TextFormField(
                          controller: _addUserPageController.useremail,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.alternate_email_rounded,
                                color: Colors.blue,
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                        TextFormField(
                          controller: _addUserPageController.userlat,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly,
                          //   LengthLimitingTextInputFormatter(10)
                          // ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                              labelText: "Geo Latitude",
                              // labelText: "Password",
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                        TextFormField(
                          controller: _addUserPageController.userlong,
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly,
                          //   LengthLimitingTextInputFormatter(10)
                          // ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                              labelText: "Geo Longitude",
                              // labelText: "Password",
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                        TextFormField(
                          controller: _addUserPageController.img,
                          cursorColor: Colors.blue,
                          readOnly:true,
                          onTap:()=> _addUserPageController.pickImage(),
                          // keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly,
                          //   LengthLimitingTextInputFormatter(10)
                          // ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.photo_camera_outlined,
                                color: Colors.blue,
                              ),
                              labelText: "Image",
                              // labelText: "Password",
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (widget, anim) {
                            final tween = Tween<double>(begin: 0, end: 1);
                            final opacity = tween.animate(anim);

                            return FadeTransition(
                              opacity: opacity,
                              child: widget,
                            );
                          },
                          child: _addUserPageController.isloading.value
                              ? const Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.centerRight,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if (_addUserPageController
                                          .userLoginFormKey.currentState!
                                          .validate()) {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        _addUserPageController.addUser();
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 45.0,
                                      width:
                                          Responsive.safeBlockHorizontal * 100,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                        // gradient: String_class.gradient_orange_button
                                      ),
                                      padding: const EdgeInsets.all(0),
                                      child: const Text(
                                        "SUBMIT",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                )),
          ),
        );
      }),
    );
  }
}
