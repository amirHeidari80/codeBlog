import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';

import 'package:flutter_codeblog/controller/home_controller.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // فراخوانی وبسرویس هوم و ارتیکل لیست
    Get.find<HomeController>().getHomeItems();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAndToNamed(
        NamedRoute.mainScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.splash.path,
              height: 64,
            ),
            const SizedBox(
              height: 32.0,
            ),
            const SpinKitFadingCube(
              color: MyColors.colorPrimery,
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
