import 'dart:developer';

import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/models/topvisited_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
  RxList<TopVisitedModel> articleList = RxList();
  Rx isLoading = false.obs;

  //درخواست دیتا با هربار فراخانی کلاس کنترلر
  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    try {
      isLoading.value = true;
      var response =
          await DioService().getMethod(url: ApiConstant.newArticlesUrl);
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
}
