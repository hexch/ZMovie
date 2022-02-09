import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zmovies/gen/assets.gen.dart';
import 'package:zmovies/getx/app_page.dart';

import 'package:zmovies/ui/controller/splash_controller.dart';

class SplashPage extends AppPage<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2B2B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Obx(() => AnimatedOpacity(
                opacity: controller.fadein.value ? 1 : 0.2,
                duration: Duration(seconds: 1),
                child: Center(
                  child: Assets.icons.logo.image(
                    width: 180,
                    height: 180,
                  ),
                ),
              )),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
