import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/colors.dart';
import 'package:flutter_codeblog/components/strings.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/controller/article/article_list_controller.dart';
import 'package:flutter_codeblog/controller/article/article_manage_controller.dart';
import 'package:flutter_codeblog/gen/assets.gen.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ArticleManageInfoScreen extends StatelessWidget {
  ArticleManageInfoScreen({super.key});
  ArticleManageController articleManageController =
      Get.find<ArticleManageController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var bodyMargin = size.width / 15;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => articleManageController.isLoading.value == false
                  ? Column(
                      children: [
                        // pic satck
                        picStackAppBar(size, theme),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Column(
                            children: [
                              TitleIconString(
                                  theme: theme,
                                  imageName: Assets.icons.bluePen,
                                  title: MyStrings.textEditTitleArticle),
                              // name and title
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 15),
                                child: Text(
                                  articleManageController
                                      .articleInfo.value.title!,
                                  style: theme.textTheme.titleLarge!
                                      .copyWith(fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TitleIconString(
                                  theme: theme,
                                  imageName: Assets.icons.bluePen,
                                  title: MyStrings.textEditBodyArticle),
                              //  text html
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 15),
                                child: SizedBox(
                                  child: HtmlWidget(
                                    articleManageController
                                        .articleInfo.value.content!,
                                    textStyle: theme.textTheme.titleLarge!
                                        .copyWith(color: Colors.grey),
                                    onLoadingBuilder:
                                        (context, element, loadingProgress) =>
                                            const SpinKitWidgetItems(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // tags mortabet
                        // tagsMortabet(bodyMargin, theme),
                        const SizedBox(
                          height: 15,
                        ),
                        // related List
                      ],
                    )
                  : const Center(
                      child: SpinKitWidgetItems(),
                    ),
            ),
          ),
        ),
      ),
    ));
  }

  Stack picStackAppBar(Size size, ThemeData theme) {
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
          height: size.height / 3.5,
          width: size.width,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: articleManageController.articleInfo.value.image!,
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                fit: BoxFit.fill,
                height: size.height / 3.5,
                width: size.width,
              ),
              placeholder: (context, url) => const SpinKitWidgetItems(),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_not_supported_outlined,
                size: 50,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 15,
          left: 20,
          right: 20,
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 26,
              ),
              Expanded(child: SizedBox()),
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 26,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.share_rounded,
                color: Colors.white,
                size: 26,
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: Container(
              width: 100,
              height: 28,
              decoration: const BoxDecoration(
                color: MyColors.colorPrimery,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'انتخاب تصویر',
                      style: theme.textTheme.bodySmall!.copyWith(fontSize: 12),
                    ),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 13,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox tagsMortabet(double bodyMargin, ThemeData theme) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: articleManageController.tagsList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? bodyMargin : 0, left: 10),
              child: InkWell(
                onTap: () {
                  Get.find<ArticleListController>().getArticlesWithTagId(
                      id: articleManageController.tagsList[index].id,
                      title: articleManageController.tagsList[index].title!);
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
                          articleManageController.tagsList[index].title!,
                          style: theme.textTheme.bodySmall,
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
}
