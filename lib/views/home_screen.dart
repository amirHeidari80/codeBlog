// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/components/strings.dart';
import 'package:flutter_codeblog/controller/home_screen_controller.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(
      {super.key,
      required this.theme,
      required this.size,
      required this.bodyMargin});

//فراخانی کلاس کنترلر
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  var theme;
  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => homeScreenController.isLoading.value == false
              ? Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    // homePagePoster
                    homePagePoster(),
                    const SizedBox(
                      height: 16,
                    ),
                    // homePageTagsList
                    homePageTagsList(),
                    Padding(
                      padding: EdgeInsets.only(
                          right: bodyMargin, top: 28, bottom: 8),
                      child: TitleIconString(
                        theme: theme,
                        imageName: Assets.icons.bluePen,
                        title: MyStrings.textViweHotBlog,
                      ),
                    ),
                    // homePageTopVisitedList
                    homePageTopVisitedList(),
                    Padding(
                      padding: EdgeInsets.only(
                          right: bodyMargin, top: 16, bottom: 8),
                      child: TitleIconString(
                        theme: theme,
                        imageName: Assets.icons.microphon,
                        title: MyStrings.textViweHotPodcast,
                      ),
                    ),
                    // homePagePodcastList
                    homePagePodcastList(),
                    SizedBox(
                      height: size.height / 13,
                    ),
                  ],
                )
              : const SpinKitWidgetItems(),
        ));
  }

  Widget homePagePoster() {
    return SizedBox(
      width: size.width / 1.19,
      height: size.height / 4.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
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
            child: CachedNetworkImage(
              imageUrl: (homeScreenController.posterItem.value.image!),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                ),
              ),
              placeholder: (context, url) => const SpinKitWidgetItems(),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_not_supported_outlined,
                size: 50,
                color: MyColors.colorDivider,
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
                Text(
                  homeScreenController.posterItem.value.title!,
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget homePageTagsList() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagsList.length,
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        homeScreenController.tagsList[index].title!,
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

  Widget homePageTopVisitedList() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topvisitedList.length,
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
                          ),
                          foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                  colors: MyGradintColors.gradintBlogs,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                          child: CachedNetworkImage(
                            imageUrl: (homeScreenController
                                .topvisitedList[index].image!),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const SpinKitWidgetItems(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: MyColors.colorDivider,
                            ),
                          ),
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
                                  homeScreenController
                                      .topvisitedList[index].author!,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              Text(
                                homeScreenController
                                    .topvisitedList[index].view!,
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
                      homeScreenController.topvisitedList[index].title!,
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

  Widget homePagePodcastList() {
    return SizedBox(
      height: size.height / 4.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: homeScreenController.podcastList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? bodyMargin : 0, left: 16),
              child: SizedBox(
                width: size.width / 2.4,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          (homeScreenController.podcastList[index].poster!),
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: size.height / 5.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(homeScreenController
                                  .podcastList[index].poster!),
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) => SizedBox(
                        height: size.height / 5.2,
                        child: const SpinKitWidgetItems(),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        height: size.height / 5.2,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: MyColors.colorDivider,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      homeScreenController.podcastList[index].title!,
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
