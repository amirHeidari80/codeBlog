// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_codeblog/const/colors.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';

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
