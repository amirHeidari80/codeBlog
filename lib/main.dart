import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codeblog/const/colors.dart';
import 'package:flutter_codeblog/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
        fontFamily: 'dana',
        textTheme: TextTheme(
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
        ),
      ),
      home: SplashScreen(),
    );
  }
}
