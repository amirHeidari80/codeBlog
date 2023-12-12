import 'dart:developer';

import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/models/article_info_model.dart';
import 'package:flutter_codeblog/models/tags_model.dart';
import 'package:flutter_codeblog/models/topvisited_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:flutter_codeblog/views/article_info_screen.dart';
import 'package:get/get.dart';

class InfoArticleController extends GetxController {
  Rx<ArticleInfoModel> articleInfoList = ArticleInfoModel().obs;
  RxList<TopVisitedModel> relatedList = RxList();
  RxList<TagsModel> tagsList = RxList();
  Rx isLoading = false.obs;

  getArticleInfo({required var id}) async {
    try {
      articleInfoList.value = ArticleInfoModel();
      relatedList.clear();
      tagsList.clear();
      Get.to(() => ArticleInfoScreen());
      isLoading.value = true;
      //TODO add end Url = &user_id=1
      var response = await DioService().getMethod(
          url:
              "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=1");
      if (response.statusCode == 200) {
        articleInfoList.value = ArticleInfoModel.fromjson(response.data);

        response.data['related'].forEach((element) {
          relatedList.add(TopVisitedModel.fromjson(element));
        });
        response.data['tags'].forEach((element) {
          tagsList.add(TagsModel.fromjson(element));
        });

        isLoading.value = false;
      }
    } catch (e) {
      log("#Catch get Article Info => $e");
      showErorrSnackBar(message: 'اتصال اینترنت خود را چک کنید', title: 'خطا');
    }
  }
}
