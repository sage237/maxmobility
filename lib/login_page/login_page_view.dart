import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../responsive.dart';
import 'login_page_controller.dart';

class LoginPageView extends StatelessWidget {
   LoginPageView({super.key});

   final LoginPageController _loginPageController=Get.find();
   @override
   Widget build(BuildContext context) {
     Responsive.init(context);

     return Scaffold(
       // backgroundColor: Colors.white,
       appBar: AppBar(
         flexibleSpace: Container(
           color: Colors.white,
         ),
         title: const Text(
           "Login",
           style: TextStyle(color: Colors.black),
         ),
         elevation: 1,
       ),
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
                 child:
                 SlideTransition(position: offsetAnimation, child: child),
               );
             },
             child: Form(
                 key: _loginPageController.userLoginFormKey,
                 child: SingleChildScrollView(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Container(
                         alignment: Alignment.centerLeft,
                         padding:
                         const EdgeInsets.symmetric(horizontal: 15),
                         child: const Text(
                           "LOGIN",
                           style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.blue,
                               fontSize: 30),
                           textAlign: TextAlign.left,
                         ),
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         margin:
                         const EdgeInsets.symmetric(horizontal: 15),
                         child: TextFormField(
                           controller: _loginPageController.username,
                           cursorColor: Colors.blue,
                           keyboardType: TextInputType.emailAddress,
                           inputFormatters: [

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
                                 Icons.alternate_email,
                                 color: Colors.blue,
                               ),
                               labelText: "email",
                               labelStyle:
                               TextStyle(color: Colors.blue)),
                         ),
                       ),
                       Container(
                         alignment: Alignment.centerLeft,
                         margin:
                         const EdgeInsets.symmetric(horizontal: 15),
                         child: TextFormField(
                           controller: _loginPageController.password, obscureText: true,
                           cursorColor: Colors.blue,
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
                                 Icons.lock,
                                 color: Colors.blue,
                               ),
                               labelText: "Password",
                               // labelText: "Password",
                               labelStyle:
                               TextStyle(color: Colors.blue)),
                         ),
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
                         child: _loginPageController.isloading.value
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
                               if (_loginPageController. userLoginFormKey.currentState!
                                   .validate()) {
                                 FocusManager
                                     .instance.primaryFocus!
                                     .unfocus();
                                 _loginPageController.login(
                                 );
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
                               Responsive.safeBlockHorizontal *
                                   50,
                               decoration: BoxDecoration(
                                 color: Colors.blue,
                                 borderRadius:
                                 BorderRadius.circular(80.0),
                                 // gradient: String_class.gradient_orange_button
                               ),
                               padding: const EdgeInsets.all(0),
                               child: const Text(
                                 "LOGIN",
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
                 )),
           ),
         );
       }),
     );
   }
}

