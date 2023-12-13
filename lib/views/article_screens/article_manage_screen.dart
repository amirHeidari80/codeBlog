// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, avoid_print
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/constants/strings.dart';
import 'package:flutter_codeblog/components/extentions.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/controller/article/article_manage_controller.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_codeblog/main.dart';
import 'package:get/get.dart';

class ArticleManageScreen extends StatelessWidget {
  ArticleManageScreen({
    super.key,
  });
  var articleManageController = Get.find<ArticleManageController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(context, 'مدیریت مقاله ها'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            child: Obx(
              () => articleManageController.isLoading.isFalse
                  ? articleManageController.articleList.isNotEmpty
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: articleManageController.articleList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                //TODO click
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: CachedNetworkImage(
                                        imageUrl: articleManageController
                                            .articleList[index].image!,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: context.screenSize.width / 3.5,
                                          height:
                                              context.screenSize.width / 3.5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        placeholder: (context, url) => SizedBox(
                                            width:
                                                context.screenSize.width / 3.5,
                                            height:
                                                context.screenSize.width / 3.5,
                                            child: const Center(
                                                child: LoadingItems())),
                                        errorWidget: (context, url, error) =>
                                            SizedBox(
                                          width: context.screenSize.width / 3.5,
                                          height:
                                              context.screenSize.width / 3.5,
                                          child: const Center(
                                            child: Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              size: 50,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            articleManageController
                                                .articleList[index].title!,
                                            style: context.customTheme.textTheme
                                                .titleLarge,
                                            overflow: TextOverflow.visible,
                                            maxLines: 2,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                articleManageController
                                                    .articleList[index].author!,
                                                style: context.customTheme
                                                    .textTheme.titleLarge!
                                                    .copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 13.0,
                                                ),
                                                overflow: TextOverflow.visible,
                                                maxLines: 1,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "- ${articleManageController.articleList[index].view!} بازدید ",
                                                  style: context.customTheme
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 13.0,
                                                  ),
                                                  overflow:
                                                      TextOverflow.visible,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Text(
                                                " ${articleManageController.articleList[index].status!}",
                                                style: context.customTheme
                                                    .textTheme.titleLarge!
                                                    .copyWith(
                                                        fontSize: 14.0,
                                                        color:
                                                            Colors.blueAccent),
                                                overflow: TextOverflow.visible,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : articleEmptyState(context)
                  : const LoadingItems(),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(NamedRoute.articleManageInfoScreen);
            },
            child: const Center(
              child: Text('بریم برای نوشتن یه مقاله باحال'),
            ),
          ),
        ),
      ),
    );
  }

// const Center(
//                     child: SpinKitWidgetItems(),
//                   )
  Center articleEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                Assets.images.emptyState.path,
                height: context.screenSize.height / 8,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: context.screenSize.width / 1.5,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.textArticleEmpty,
                        style: context.customTheme.textTheme.titleLarge)),
              ),
            ],
          ),
          SizedBox(
            height: context.screenSize.height / 25,
          ),
        ],
      ),
    );
  }
}
