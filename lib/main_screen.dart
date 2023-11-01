import 'package:flutter/material.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu_rounded),
                  Image.asset(
                    Assets.images.splash.path,
                    height: size.height / 13.6,
                  ),
                  const Icon(Icons.search_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
