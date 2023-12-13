// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/constants/colors.dart';
import 'package:flutter_codeblog/components/extentions.dart';
import 'package:flutter_codeblog/components/constants/strings.dart';
import 'package:flutter_codeblog/components/storage_key.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/main.dart';
import 'package:flutter_codeblog/views/main_screens/home_screen.dart';
import 'package:flutter_codeblog/views/main_screens/profile_screen.dart';
import 'package:flutter_codeblog/views/regester_screens/regester_intro.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  Rx<int> selectedIndexPage = 0.obs;
  final GlobalKey<ScaffoldState> _keyScaffoldstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _keyScaffoldstate,
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.bodyMargin10),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.images.splash.path,
                    scale: 3.0,
                  ),
                ),
                ListTile(
                  onTap: () {
                    selectedIndexPage.value = 2;
                    _keyScaffoldstate.currentState!.closeDrawer();
                  },
                  title: Text(
                    'پروفایل کاربری',
                    style: context.customTheme.textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  height: 3,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'درباره تک بللاگ',
                    style: context.customTheme.textTheme.titleLarge,
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
                    style: context.customTheme.textTheme.titleLarge,
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
                    style: context.customTheme.textTheme.titleLarge,
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
                height: context.screenSize.height / 14.6,
              ),
              InkWell(
                onTap: () {},
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
                    HomeScreen(),
                    const RegesterIntroScreen(),
                    const ProfileScreen(),
                  ],
                ),
              ),
            ),
            BottomNav(
              callBackDataOnTap: (int value) {
                if (value == 1) {
                  GetStorage().read(StorageKey.tokenKey) == null
                      ? selectedIndexPage.value = value
                      : showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: context.customTheme.height / 3,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        width: 40,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.images.tcbot.path,
                                          height: 50,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "دونسته هاتو با بقیه به اشتراک بذار ...",
                                          style: context
                                              .customTheme.textTheme.titleLarge,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      """فکر کن!!! اینجا هستی یک گیگ تکنولوژِی هستی تجربیاتت رو با جامعه فارسی یه اشتراک بذار""",
                                      style: context
                                          .customTheme.textTheme.titleLarge,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.offNamed(NamedRoute
                                                  .manageArtcleScreen);
                                            },
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  Assets.icons.writeArticleIcon
                                                      .path,
                                                  height: 25,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "مدیریت مقاله ها",
                                                  style: context.customTheme
                                                      .textTheme.titleLarge,
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  Assets.icons.writePodcastIcon
                                                      .path,
                                                  height: 25,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "مدیریت پادکست ها",
                                                  style: context.customTheme
                                                      .textTheme.titleLarge,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                } else {
                  selectedIndexPage.value = value;
                }
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
    required this.callBackDataOnTap,
    required this.selectedIndexPage,
  });

  final Rx<int> selectedIndexPage;
  final void Function(int) callBackDataOnTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: context.screenSize.height / 12,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: MyGradintColors.gradintBottomNavBg,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(
              context.bodyMargin10, 5, context.bodyMargin10, 5),
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
