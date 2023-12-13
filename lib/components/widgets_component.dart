// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/constants/colors.dart';
import 'package:flutter_codeblog/components/extentions.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleIconString extends StatelessWidget {
  TitleIconString({
    super.key,
    required this.imageName,
    required this.title,
    this.isCentering = false,
  });

  AssetGenImage imageName;
  String title;
  bool isCentering;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCentering ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        ImageIcon(
          Image.asset(imageName.path).image,
          color: MyColors.colorTitle,
          size: 20,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: context.customTheme.textTheme.titleMedium,
        ),
      ],
    );
  }
}

class DividerCustom extends StatelessWidget {
  DividerCustom({
    super.key,
    required this.sizeWidth,
  });

  int sizeWidth;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.colorDivider,
      indent: context.screenSize.width / sizeWidth,
      endIndent: context.screenSize.width / sizeWidth,
    );
  }
}

class InkWellTextBtnDraverAndProfile extends StatelessWidget {
  InkWellTextBtnDraverAndProfile({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: MyColors.colorPrimery.withOpacity(0.5),
      child: SizedBox(
        height: context.screenSize.height / 15,
        width: context.screenSize.width,
        child: Center(
          child: Text(
            title,
            style: context.customTheme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}

class SpinKitWidgetItems extends StatelessWidget {
  const SpinKitWidgetItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      color: MyColors.colorPrimery,
    );
  }
}

myUrlLuncher(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("myUrlLuncher is Can't Url: $url ");
  }
}

PreferredSize appBarAllPage(BuildContext context, String title) {
  var theme = Theme.of(context);
  return PreferredSize(
    preferredSize: const Size.fromHeight(45),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Center(
              child: Text(
            title,
            style: theme.textTheme.displayLarge,
          )),
        ],
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.colorPrimery.withOpacity(0.8),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

SnackbarController showErorrSnackBar(
    {required String message, required String title}) {
  return Get.snackbar('', '',
      backgroundGradient: LinearGradient(
        colors: [MyColors.colorPrimery, MyColors.colorPrimery.withOpacity(0.2)],
        end: Alignment.centerLeft,
        begin: Alignment.centerRight,
      ),
      titleText: Text(
        title,
        style: TextStyle(
          color: title == "خطا" ? Colors.redAccent : Colors.greenAccent,
        ),
      ),
      messageText: Text(message),
      backgroundColor: MyColors.colorPrimery.withOpacity(0.9),
      onTap: (GetSnackBar a) {
    Get.closeAllSnackbars();
  },
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.endToStart,
      icon: title == "خطا"
          ? const Icon(
              Icons.error,
              size: 30,
              color: Colors.redAccent,
            )
          : const Icon(
              Icons.task_alt_outlined,
              size: 30,
              color: Colors.greenAccent,
            ));
}
