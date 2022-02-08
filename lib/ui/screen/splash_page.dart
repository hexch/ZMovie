import 'package:flutter/material.dart';
import 'package:zmovies/getx/app_page.dart';

import 'package:zmovies/ui/controller/splash_controller.dart';

class SplashPage extends AppPage<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Center(child: Text('SPLASH')),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
