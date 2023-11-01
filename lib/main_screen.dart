import 'package:flutter/material.dart';
import 'package:flutter_codeblog/const/colors.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/models/fakedata.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
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
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width / 1.19,
                height: size.height / 4.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset(homePagePosterMap["imageUrl"])
                                .image),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: MyGradintColors.gradintCoverHomePost,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: MyGradintColors.gradintCoverHomePost,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                homePagePosterMap["writer"] +
                                    ' - ' +
                                    homePagePosterMap["date"],
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                homePagePosterMap["viwe"],
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Text(
                            homePagePosterMap["title"],
                            style: theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 25,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: MyGradintColors.gradintTags,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
