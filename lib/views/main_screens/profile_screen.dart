// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/constants/strings.dart';
import 'package:flutter_codeblog/components/extentions.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

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
            height: context.screenSize.height / 8,
          ),
          const SizedBox(
            height: 12,
          ),
          TitleIconString(
            imageName: Assets.icons.bluePen,
            title: MyStrings.textImageProfile,
            isCentering: true,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'امیر حیدری',
            style: context.customTheme.textTheme.titleLarge,
          ),
          Text(
            'example@gmail.com',
            style: context.customTheme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          DividerCustom(
            sizeWidth: 6,
          ),
          InkWellTextBtnDraverAndProfile(
            onTap: () {},
            title: MyStrings.textFavBlog,
          ),
          DividerCustom(
            sizeWidth: 6,
          ),
          InkWellTextBtnDraverAndProfile(
            onTap: () {},
            title: MyStrings.textFavPodcast,
          ),
          DividerCustom(
            sizeWidth: 6,
          ),
          InkWellTextBtnDraverAndProfile(
            onTap: () {},
            title: MyStrings.textLogOut,
          ),
          SizedBox(
            height: context.screenSize.height / 13,
          ),
        ],
      ),
    );
  }
}
