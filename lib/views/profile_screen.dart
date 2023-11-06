// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/const/strings.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/my_component.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen(
      {super.key,
      required this.theme,
      required this.size,
      required this.bodyMargin});
  final Size size;
  final double bodyMargin;
  var theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.profileAvatar.path,
            height: size.height / 8,
          ),
          const SizedBox(
            height: 12,
          ),
          TitleIconString(
            theme: theme,
            imageName: Assets.icons.bluePen,
            title: MyStrings.textImageProfile,
            isCentering: true,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'امیر حیدری',
            style: theme.textTheme.titleLarge,
          ),
          Text(
            'example@gmail.com',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          DividerCustom(
            size: size,
            sizeWidth: 6,
          ),
          InkWellTextBtnDraverAndProfile(
            size: size,
            theme: theme,
            onTap: () {},
            title: MyStrings.textFavBlog,
          ),
          DividerCustom(
            size: size,
            sizeWidth: 6,
          ),
          InkWellTextBtnDraverAndProfile(
            size: size,
            theme: theme,
            onTap: () {},
            title: MyStrings.textFavPodcast,
          ),
          DividerCustom(
            size: size,
            sizeWidth: 6,
          ),
          InkWellTextBtnDraverAndProfile(
            size: size,
            theme: theme,
            onTap: () {},
            title: MyStrings.textLogOut,
          ),
          SizedBox(
            height: size.height / 13,
          ),
        ],
      ),
    );
  }
}
