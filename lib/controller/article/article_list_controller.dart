import 'dart:developer';

import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/models/topvisited_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:flutter_codeblog/views/article_screens/article_list_screen.dart';
import 'package:get/get.dart';

class ArticleListController extends GetxController {
  RxList<TopVisitedModel> articleList = RxList();
  Rx isLoading = false.obs;

  getArticleList() async {
    try {
      isLoading.value = true;
      //TODO add end Url = &user_id=1
      var response = await DioService().getMethod(
          url: "${ApiConstant.baseUrl}article/get.php?command=new&user_id=1");
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          articleList.add(TopVisitedModel.fromjson(element));
        });
        isLoading.value = false;
      }
    } catch (e) {
      log("#Catch get Article List => $e");
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
          articleList.add(TopVisitedModel.fromjson(element));
        });
        isLoading.value = false;
      }
    } catch (e) {
      log("#Catch get Articles With TagId => $e");
      showErorrSnackBar(message: 'اتصال اینترنت خود را چک کنید', title: 'خطا');
    }
  }
}
