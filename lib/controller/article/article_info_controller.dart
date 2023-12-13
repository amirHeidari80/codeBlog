import 'dart:developer';
import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/components/storage_key.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/main.dart';
import 'package:flutter_codeblog/models/article_info_model.dart';
import 'package:flutter_codeblog/models/tags_model.dart';
import 'package:flutter_codeblog/models/article_list_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArticleInfoController extends GetxController {
  Rx<ArticleInfoModel> articleInfoList = ArticleInfoModel(null, null, null).obs;
  RxList<ArticleListModel> relatedList = RxList();
  RxList<TagsModel> tagsList = RxList();
  Rx isLoading = false.obs;

  getArticleInfo({required var id}) async {
    try {
      articleInfoList.value = ArticleInfoModel(null, null, null);
      relatedList.clear();
      tagsList.clear();
      Get.toNamed(NamedRoute.infoArtcleScreen);
      isLoading.value = true;

      var response = await DioService().getMethod(
          url:
              // ignore: prefer_interpolation_to_compose_strings
              "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=" +
                  GetStorage().read(StorageKey.userIdKey));
      if (response.statusCode == 200) {
        articleInfoList.value = ArticleInfoModel.fromjson(response.data);

        response.data['related'].forEach((element) {
          relatedList.add(ArticleListModel.fromjson(element));
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
