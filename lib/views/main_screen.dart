// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/views/home_screen.dart';
import 'package:flutter_codeblog/views/profile_screen.dart';
import 'package:flutter_codeblog/views/regester_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedIndexPage = 0;
final GlobalKey<ScaffoldState> _keyScaffoldstate = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
                  title: Text(
                    'پروفایل کاربری',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'درباره تک بللاگ',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                ListTile(
                  onTap: () {},
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
              const Icon(
                Icons.search_rounded,
                color: MyColors.colorTextTitle,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                alignment: Alignment.center,
                index: selectedIndexPage,
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
            BottomNav(
              size: size,
              bodyMargin: bodyMargin,
              callBackDataOnTap: (int value) {
                setState(() {
                  selectedIndexPage = value;
                });
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
  final int selectedIndexPage;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => callBackDataOnTap(0),
                icon: ImageIcon(
                  Image.asset(Assets.icons.home.path).image,
                  color:
                      selectedIndexPage != 0 ? Colors.grey[400] : Colors.white,
                  size: selectedIndexPage != 0 ? 25 : 30,
                ),
              ),
              IconButton(
                onPressed: () => callBackDataOnTap(1),
                icon: ImageIcon(
                  Image.asset(Assets.icons.write.path).image,
                  color:
                      selectedIndexPage != 1 ? Colors.grey[400] : Colors.white,
                  size: selectedIndexPage != 1 ? 25 : 30,
                ),
              ),
              IconButton(
                onPressed: () => callBackDataOnTap(2),
                icon: ImageIcon(
                  Image.asset(Assets.icons.user.path).image,
                  color:
                      selectedIndexPage != 2 ? Colors.grey[400] : Colors.white,
                  size: selectedIndexPage != 2 ? 25 : 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
