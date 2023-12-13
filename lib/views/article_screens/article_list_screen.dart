import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/controller/article/article_list_controller.dart';
import 'package:flutter_codeblog/controller/article/article_info_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key, this.title});
  String? title;

  var listArticleController = Get.find<ArticleListController>();
  var infoArticleController = Get.find<ArticleInfoController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
          appBar: appBarAllPage(context, title!),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              child: Obx(
                () => listArticleController.isLoading.value == false
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: listArticleController.articleList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              infoArticleController.getArticleInfo(
                                  id: listArticleController
                                      .articleList[index].id!);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: CachedNetworkImage(
                                      imageUrl: listArticleController
                                          .articleList[index].image!,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: size.width / 3.5,
                                        height: size.width / 3.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      placeholder: (context, url) => SizedBox(
                                          width: size.width / 3.5,
                                          height: size.width / 3.5,
                                          child: const Center(
                                              child: SpinKitWidgetItems())),
                                      errorWidget: (context, url, error) =>
                                          SizedBox(
                                        width: size.width / 3.5,
                                        height: size.width / 3.5,
                                        child: const Center(
                                          child: Icon(
                                            Icons.image_not_supported_outlined,
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
                                          listArticleController
                                              .articleList[index].title!,
                                          style: theme.textTheme.titleLarge,
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
                                              listArticleController
                                                  .articleList[index].author!,
                                              style: theme.textTheme.titleLarge!
                                                  .copyWith(color: Colors.grey),
                                              overflow: TextOverflow.visible,
                                              maxLines: 2,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${listArticleController.articleList[index].view!} بازدید ",
                                              style: theme.textTheme.titleLarge!
                                                  .copyWith(color: Colors.grey),
                                              overflow: TextOverflow.visible,
                                              maxLines: 2,
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
                    : const Center(
                        child: SpinKitWidgetItems(),
                      ),
              ),
            ),
          )),
    );
  }
}
