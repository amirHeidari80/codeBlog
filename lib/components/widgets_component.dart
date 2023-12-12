// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleIconString extends StatelessWidget {
  TitleIconString({
    super.key,
    required this.theme,
    required this.imageName,
    required this.title,
    this.isCentering = false,
  });

  var theme;

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
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}

class DividerCustom extends StatelessWidget {
  DividerCustom({
    super.key,
    required this.size,
    required this.sizeWidth,
  });

  final Size size;
  int sizeWidth;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.colorDivider,
      indent: size.width / sizeWidth,
      endIndent: size.width / sizeWidth,
    );
  }
}

class InkWellTextBtnDraverAndProfile extends StatelessWidget {
  InkWellTextBtnDraverAndProfile({
    super.key,
    required this.size,
    required this.theme,
    required this.onTap,
    required this.title,
  });

  var theme;
  final Size size;
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: MyColors.colorPrimery.withOpacity(0.5),
      child: SizedBox(
        height: size.height / 15,
        width: size.width,
        child: Center(
          child: Text(
            title,
            style: theme.textTheme.titleLarge,
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
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.colorPrimery.withOpacity(0.8),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
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
