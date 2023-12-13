import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/constants/colors.dart';
import 'package:flutter_codeblog/components/extentions.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/controller/article/article_info_controller.dart';
import 'package:flutter_codeblog/controller/article/article_list_controller.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ArticleInfoScreen extends StatelessWidget {
  ArticleInfoScreen({super.key});
  ArticleInfoController infoArticleController =
      Get.find<ArticleInfoController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: context.screenSize.height,
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => infoArticleController.isLoading.value == false
                  ? Column(
                      children: [
                        // pic satck
                        picStackAppBar(context),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              // name and title
                              Text(
                                infoArticleController
                                    .articleInfoList.value.title!,
                                style: context.customTheme.textTheme.titleLarge!
                                    .copyWith(fontSize: 16.0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.images.profileAvatar.path,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      infoArticleController
                                          .articleInfoList.value.author!,
                                      style: context
                                          .customTheme.textTheme.titleLarge,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      infoArticleController
                                          .articleInfoList.value.createdAt!,
                                      style: context
                                          .customTheme.textTheme.bodyMedium!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              //  text html
                              SizedBox(
                                child: HtmlWidget(
                                  infoArticleController
                                      .articleInfoList.value.content!,
                                  textStyle:
                                      context.customTheme.textTheme.titleLarge,
                                  onLoadingBuilder:
                                      (context, element, loadingProgress) =>
                                          const LoadingItems(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // tags mortabet
                        tagsMortabet(context),
                        const SizedBox(
                          height: 15,
                        ),
                        // related List
                        relatedList(context),
                      ],
                    )
                  : const LoadingItems(),
            ),
          ),
        ),
      ),
    ));
  }

  Stack picStackAppBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: MyGradintColors.gradintCoverHomePost,
              end: Alignment.topCenter,
              begin: Alignment.center,
            ),
          ),
          height: context.screenSize.height / 3.5,
          width: context.screenSize.width,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: infoArticleController.articleInfoList.value.image!,
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                fit: BoxFit.fill,
                height: context.screenSize.height / 3.5,
                width: context.screenSize.width,
              ),
              placeholder: (context, url) => const LoadingItems(),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_not_supported_outlined,
                size: 50,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          right: 20,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const SizedBox(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.share_rounded,
                color: Colors.white,
                size: 26,
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox tagsMortabet(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: infoArticleController.tagsList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? context.bodyMargin10 : 0, left: 10),
              child: InkWell(
                onTap: () {
                  Get.find<ArticleListController>().getArticlesWithTagId(
                      id: infoArticleController.tagsList[index].id,
                      title: infoArticleController.tagsList[index].title!);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey),
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
                          infoArticleController.tagsList[index].title!,
                          style: context.customTheme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  SizedBox relatedList(BuildContext context) {
    return SizedBox(
      height: context.screenSize.height / 3.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: infoArticleController.relatedList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? context.bodyMargin10 : 0, left: 16),
              child: GestureDetector(
                onTap: () {
                  infoArticleController.getArticleInfo(
                      id: infoArticleController.relatedList[index].id);
                },
                child: SizedBox(
                  width: context.screenSize.width / 2.4,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: context.screenSize.height / 4.7,
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
                              imageUrl: (infoArticleController
                                  .relatedList[index].image!),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: imageProvider,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const LoadingItems(),
                              errorWidget: (context, url, error) => SizedBox(
                                width: context.screenSize.width / 2.4,
                                child: const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: MyColors.colorDivider,
                                ),
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
                                    infoArticleController
                                            .relatedList[index].author ??
                                        "امیر حیدری",
                                    style: context
                                        .customTheme.textTheme.bodyMedium,
                                  ),
                                ),
                                Text(
                                  infoArticleController
                                      .relatedList[index].view!,
                                  style:
                                      context.customTheme.textTheme.bodyMedium,
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
                        infoArticleController.relatedList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: context.customTheme.textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
