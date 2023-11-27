// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/components/strings.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:flutter_codeblog/views/article_list_screen.dart';
import 'package:flutter_codeblog/views/home_screen.dart';
import 'package:flutter_codeblog/views/profile_screen.dart';
import 'package:flutter_codeblog/views/regester_intro.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  Rx<int> selectedIndexPage = 0.obs;
  final GlobalKey<ScaffoldState> _keyScaffoldstate = GlobalKey();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DioService().getMethod(url: ApiConstant.getHomeItemsUrl);
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _keyScaffoldstate,
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.images.splash.path,
                    scale: 3,
                  ),
                ),
                ListTile(
                  onTap: () {
                    selectedIndexPage.value = 2;
                    _keyScaffoldstate.currentState!.closeDrawer();
                  },
                  title: Text(
                    'پروفایل کاربری',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                ListTile(
                  onTap: () {
                    //TODO این تست صفجه ارتیکل لیست است
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ArticleListScreen()));
                  },
                  title: Text(
                    'درباره تک بللاگ',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                ListTile(
                  onTap: () async {
                    await Share.share(MyStrings.textShare,
                        subject: 'اشتراک گذاری تک بلاگ');
                  },
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                ListTile(
                  onTap: () {
                    myUrlLuncher(MyStrings.urlGithub);
                  },
                  title: Text(
                    'تک بلاگ در گیت هاب',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.colorScaffoldBG,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _keyScaffoldstate.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu_rounded,
                  color: MyColors.colorTextTitle,
                ),
              ),
              Image.asset(
                Assets.images.splash.path,
                height: size.height / 14.6,
              ),
              InkWell(
                onTap: () {
                  //TODO این تست صفجه بلاگ است
                },
                child: const Icon(
                  Icons.search_rounded,
                  color: MyColors.colorTextTitle,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(
                () => IndexedStack(
                  alignment: Alignment.center,
                  index: selectedIndexPage.value,
                  children: [
                    HomeScreen(
                      bodyMargin: bodyMargin,
                      size: size,
                      theme: theme,
                    ),
                    RegesterIntroScreen(
                      bodyMargin: bodyMargin,
                      size: size,
                      theme: theme,
                    ),
                    ProfileScreen(
                      bodyMargin: bodyMargin,
                      size: size,
                      theme: theme,
                    ),
                  ],
                ),
              ),
            ),
            BottomNav(
              size: size,
              bodyMargin: bodyMargin,
              callBackDataOnTap: (int value) {
                selectedIndexPage.value = value;
              },
              selectedIndexPage: selectedIndexPage,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.callBackDataOnTap,
    required this.selectedIndexPage,
  });

  final Size size;
  final double bodyMargin;
  final Rx<int> selectedIndexPage;
  final void Function(int) callBackDataOnTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: size.height / 12,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: MyGradintColors.gradintBottomNavBg,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(bodyMargin, 5, bodyMargin, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: MyGradintColors.gradintBottomNav,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => callBackDataOnTap(0),
                  icon: ImageIcon(
                    Image.asset(Assets.icons.home.path).image,
                    color: selectedIndexPage.value != 0
                        ? Colors.grey[400]
                        : Colors.white,
                    size: selectedIndexPage.value != 0 ? 25 : 30,
                  ),
                ),
                IconButton(
                  onPressed: () => callBackDataOnTap(1),
                  icon: ImageIcon(
                    Image.asset(Assets.icons.write.path).image,
                    color: selectedIndexPage.value != 1
                        ? Colors.grey[400]
                        : Colors.white,
                    size: selectedIndexPage.value != 1 ? 25 : 30,
                  ),
                ),
                IconButton(
                  onPressed: () => callBackDataOnTap(2),
                  icon: ImageIcon(
                    Image.asset(Assets.icons.user.path).image,
                    color: selectedIndexPage.value != 2
                        ? Colors.grey[400]
                        : Colors.white,
                    size: selectedIndexPage.value != 2 ? 25 : 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
