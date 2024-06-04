import 'package:assign_maxmobility/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addUserPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
