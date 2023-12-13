import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codeblog/bindings.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/my_http_overrides.dart';
import 'package:flutter_codeblog/views/article_screens/article_info_screen.dart';
import 'package:flutter_codeblog/views/article_screens/article_list_screen.dart';
import 'package:flutter_codeblog/views/article_screens/article_manage_info_screen.dart';
import 'package:flutter_codeblog/views/article_screens/article_manage_screen.dart';
import 'package:flutter_codeblog/views/main_screens/main_screen.dart';
import 'package:flutter_codeblog/views/main_screens/profile_screen.dart';
import 'package:flutter_codeblog/views/regester_screens/regester_intro.dart';
import 'package:flutter_codeblog/views/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Handshake error in client : CERTIFICATE_VERIFY_FAILED
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.colorStatusBar,
      systemNavigationBarColor: MyColors.colorNavigationBar,
      statusBarIconBrightness: ThemeMode.system == ThemeMode.light
          ? Brightness.light
          : Brightness.dark,
      systemNavigationBarIconBrightness: ThemeMode.system == ThemeMode.light
          ? Brightness.light
          : Brightness.dark,
    ),
  );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("fa", "IR"),
      themeMode: ThemeMode.light,
      theme: lightTheme(theme),
      initialRoute: NamedRoute.splashScreen,
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
            name: NamedRoute.splashScreen,
            page: () => const SplashScreen(),
            bindings: [
              HomeBinding(),
            ],
            transition: Transition.cupertino),
        GetPage(
            name: NamedRoute.mainScreen,
            page: () => MainScreen(),
            bindings: [
              RegesterBinding(),
              ArticleBinding(),
              ArticleManageBinding()
            ],
            transition: Transition.cupertino),
        GetPage(
            name: NamedRoute.listArtcleScreen,
            page: () => ArticleListScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: NamedRoute.infoArtcleScreen,
            page: () => ArticleInfoScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: NamedRoute.manageArtcleScreen,
            page: () => ArticleManageScreen(),
            bindings: [ArticleManageBinding()],
            transition: Transition.cupertino),
        GetPage(
            name: NamedRoute.articleManageInfoScreen,
            page: () => ArticleManageInfoScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: NamedRoute.regesterScreen,
            page: () => const RegesterIntroScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: NamedRoute.profileScreen,
            page: () => const ProfileScreen(),
            transition: Transition.cupertino),
      ],
      home: const SplashScreen(),
    );
  }

  ThemeData lightTheme(ThemeData theme) {
    return ThemeData(
      useMaterial3: false,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: MyColors.colorPrimery,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: MyColors.colorPrimery),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(double.infinity, 40)),
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return MyGradintColors.gradintBottomNav[0];
            } else {
              return MyGradintColors.gradintBottomNav[1];
            }
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return theme.textTheme.bodyLarge!.copyWith(fontSize: 15.5);
            } else {
              return theme.textTheme.bodySmall!.copyWith(fontSize: 15);
            }
          }),
        ),
      ),
      fontFamily: 'dana',
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: MyColors.colorPosterTitle,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: MyColors.colorPosterSubText,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          color: MyColors.colorPosterTitle,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        titleMedium: TextStyle(
          color: MyColors.colorTitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: MyColors.colorSubText,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: MyColors.colorHintText,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        displayLarge: TextStyle(
          color: MyColors.colorPrimery,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class NamedRoute {
  static String splashScreen = '/';
  static String mainScreen = '/mainScreen';
  static String listArtcleScreen = '/listArtcleScreen';
  static String infoArtcleScreen = '/infoArtcleScreen';
  static String manageArtcleScreen = '/manageArtcleScreen';
  static String articleManageInfoScreen = '/articleManageInfoScreen';
  static String regesterScreen = '/regesterScreen';
  static String profileScreen = '/profileScreen';
}
