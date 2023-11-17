import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/views/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.colorStatusBar,
      systemNavigationBarColor: MyColors.colorNavigationBar,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: MyColors.colorPrimery,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 2, color: MyColors.colorPrimery),
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
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
