// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_codeblog/const/colors.dart';
import 'package:flutter_codeblog/const/strings.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/models/fakedata.dart';
import 'package:flutter_codeblog/my_component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(
      {super.key,
      required this.theme,
      required this.size,
      required this.bodyMargin});

  var theme;
  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          HomePagePoster(size: size, theme: theme),
          const SizedBox(
            height: 16,
          ),
          HomePageHashtagList(size: size, bodyMargin: bodyMargin, theme: theme),
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, top: 28, bottom: 8),
            child: TitleIconString(
              theme: theme,
              imageName: Assets.icons.bluePen,
              title: MyStrings.textViweHotBlog,
            ),
          ),
          HomePageTextsList(size: size, bodyMargin: bodyMargin, theme: theme),
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, top: 16, bottom: 8),
            child: TitleIconString(
              theme: theme,
              imageName: Assets.icons.microphon,
              title: MyStrings.textViweHotPodcast,
            ),
          ),
          HomePagePodcastList(size: size, bodyMargin: bodyMargin, theme: theme),
          SizedBox(
            height: size.height / 13,
          ),
        ],
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  HomePagePoster({
    super.key,
    required this.size,
    required this.theme,
  });

  final Size size;

  var theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.19,
      height: size.height / 4.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(homePagePosterMap["imageUrl"]).image),
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
    );
  }
}

class HomePageHashtagList extends StatelessWidget {
  HomePageHashtagList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.theme,
  });

  final Size size;
  final double bodyMargin;
  var theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listHshtak.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? bodyMargin : 0, left: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                      colors: MyGradintColors.gradintTags,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.tag_rounded,
                        color: MyColors.colorPosterTitle,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        listHshtak[index].title.toString(),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HomePageTextsList extends StatelessWidget {
  HomePageTextsList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.theme,
  });

  final Size size;
  final double bodyMargin;
  var theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: blogList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? bodyMargin : 0, left: 16),
              child: SizedBox(
                width: size.width / 2.4,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height / 4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(blogList[index].imageUrl),
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                  colors: MyGradintColors.gradintBlogs,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          right: 10,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  blogList[index].writer,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              Text(
                                blogList[index].views,
                                style: theme.textTheme.bodyMedium,
                              ),
                              const Icon(
                                Icons.remove_red_eye_sharp,
                                color: MyColors.colorPosterSubText,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      blogList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.titleLarge,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  HomePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.theme,
  });

  final Size size;
  final double bodyMargin;
  var theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: blogList.getRange(4, 10).length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? bodyMargin : 0, left: 16),
              child: SizedBox(
                width: size.width / 2.4,
                child: Column(
                  children: [
                    Container(
                      height: size.height / 5.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(blogList[index].imageUrl),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      blogList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.textTheme.titleLarge,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
