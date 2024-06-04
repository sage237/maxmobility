import 'package:flutter/material.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min,children: [
          Image.asset('assets/mmlogo.png'),
          const Text('Max Mobility Pvt Ltd',style: TextStyle(fontSize: 25),)
        ],),
      ),
    );
  }
}
