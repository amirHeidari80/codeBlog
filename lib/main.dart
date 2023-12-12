import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codeblog/binding.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/my_http_overrides.dart';
import 'package:flutter_codeblog/views/article_list_screen.dart';
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
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
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
      theme: lightTheme(theme),
      initialRoute: routeSplashScreen,
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
            name: routeSplashScreen,
            page: () => const SplashScreen(),
            bindings: [HomeBinding()],
            transition: Transition.cupertino),
        GetPage(
            name: routeMainScreen,
            page: () => MainScreen(),
            bindings: [RegesterBinding(), ArticleBinding()],
            transition: Transition.cupertino),
        GetPage(
            name: routeListArtcleScreen,
            page: () => ArticleListScreen(),
            bindings: [RegesterBinding()],
            transition: Transition.cupertino),
        GetPage(
            name: routeInfoArtcleScreen,
            page: () => ArticleListScreen(),
            bindings: [RegesterBinding()],
            transition: Transition.cupertino),
        GetPage(
            name: routeRegesterScreen,
            page: () => const RegesterIntroScreen(),
            bindings: [RegesterBinding()],
            transition: Transition.cupertino),
        GetPage(
            name: routeProfileScreen,
            page: () => const ProfileScreen(),
            // bindings: [RegesterBinding()],
            transition: Transition.cupertino),
      ],
      home: const SplashScreen(),
    );
  }

  ThemeData lightTheme(ThemeData theme) {
    return ThemeData(
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
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return MyGradintColors.gradintBottomNav[0];
            } else {
              return MyGradintColors.gradintBottomNav[1];
            }
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return theme.textTheme.bodyLarge!.copyWith(fontSize: 18);
            } else {
              return theme.textTheme.bodySmall!.copyWith(fontSize: 16);
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

const String routeSplashScreen = '/';
const String routeMainScreen = '/mainScreen';
const String routeListArtcleScreen = '/listArtcleScreen';
const String routeInfoArtcleScreen = '/infoArtcleScreen';
const String routeRegesterScreen = '/regesterScreen';
const String routeProfileScreen = '/profileScreen';
