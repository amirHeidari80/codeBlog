import 'dart:developer';

import 'package:flutter_codeblog/components/constants/api_constant.dart';
import 'package:flutter_codeblog/components/storage_key.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/models/article_list_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:flutter_codeblog/views/article_screens/article_list_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArticleListController extends GetxController {
  RxList<ArticleListModel> articleList = RxList();
  Rx isLoading = false.obs;

  getArticleList() async {
    try {
      isLoading.value = true;

      var response = await DioService().getMethod(
          // ignore: prefer_interpolation_to_compose_strings
          url: "${ApiConstant.baseUrl}article/get.php?command=new&user_id=" +
              GetStorage().read(StorageKey.userIdKey));
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          articleList.add(ArticleListModel.fromjson(element));
        });
        isLoading.value = false;
      }
    } catch (e) {
      log("#Catch get Article List => $e");
      showCustomSnackBar(message: 'اتصال اینترنت خود را چک کنید', title: 'خطا');
    }
  }

  getArticlesWithTagId({required var id, required String title}) async {
    try {
      Get.to(() => ArticleListScreen(title: title));
      isLoading.value = true;
      var response = await DioService().getMethod(
          url:
              "${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id");
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          articleList.add(ArticleListModel.fromjson(element));
        });
        isLoading.value = false;
      }
    } catch (e) {
      log("#Catch get Articles With TagId => $e");
      showCustomSnackBar(message: 'اتصال اینترنت خود را چک کنید', title: 'خطا');
    }
  }
}
