import 'dart:convert';

import 'package:assign_maxmobility/home_page/home_page_controller.dart';
import 'package:assign_maxmobility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../responsive.dart';
import 'user_modal.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});
  final HomePageController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: _controller.isloading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: _controller.getUsers,
                child: _controller.users.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          User user = _controller.users[index];

                          return Card(
                            // elevation: 6,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                bottom: Responsive.safeBlockVertical * 2),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Responsive.safeBlockVertical * 2,
                                  horizontal:
                                      Responsive.safeBlockHorizontal * 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all()),
                                    clipBehavior: Clip.hardEdge,
                                    height: Responsive.safeBlockVertical * 10,
                                    width: Responsive.safeBlockVertical * 10,
                                    child: Image.memory(
                                      base64Decode(user.memberimg),
                                      errorBuilder: (a, s, v) =>
                                          const Icon(Icons.person),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Responsive.safeBlockHorizontal * 6,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${user.membername} ',
                                        style: TextStyle(
                                            fontSize:
                                                Responsive.safeBlockVertical *
                                                    2.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: '${user.memberadress}',
                                            style: const TextStyle(
                                                color: Colors.black))
                                      ])),
                                      SizedBox(
                                        height: Responsive.safeBlockVertical,
                                      ),
                                      RichText(
                                          text: TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.phone,
                                          size: 15,
                                        )),
                                        TextSpan(
                                            text: ' ${user.membermobile} ',
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        WidgetSpan(
                                            child: SizedBox(
                                          width: 10,
                                        )),
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.email,
                                          size: 15,
                                        )),
                                        TextSpan(
                                            text: ' ${user.memberemail}',
                                            style: const TextStyle(
                                                color: Colors.black)),
                                      ])),
                                    ],
                                  )),
                                  GestureDetector(
                                    child: const Icon(Icons.map),
                                    onTap: () async {
                                      String googleUrl =
                                          'https://www.google.com/maps/search/?api=1&query=${user.memberlat},${user.memberlong}';
                                      if (true) {
                                        await launchUrl(Uri.parse(googleUrl),
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        throw 'Could not open the map.';
                                      }
                                    },
                                  ),
                                  SizedBox(
                                      width: Responsive.safeBlockHorizontal * 3)
                                ],
                              ),
                            ),
                          );
                          return ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                              radius: 70,
                              child: ClipOval(
                                child: Image.memory(
                                  base64Decode(user.memberimg),
                                  errorBuilder: (a, s, v) =>
                                      const Icon(Icons.person),
                                ),
                              ),
                            ),
                            title: Text(
                              "${user.membername} ",
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${user.membermobile}'),
                                Text('${user.memberemail}'),
                                Text('${user.memberadress}'),
                              ],
                            ),
                            trailing: TextButton(
                              onPressed: () {},
                              child: Icon(Icons.map),
                            ),
                            // contentPadding: EdgeInsets.zero,
                          );
                        },
                        itemCount: _controller.users.length,
                      )
                    : const Center(
                        child: Text('Empty'),
                      ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addUserPage);
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
