import 'dart:developer';

import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/components/storage_key.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/models/article_info_model.dart';
import 'package:flutter_codeblog/models/article_list_model.dart';
import 'package:flutter_codeblog/models/tags_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ArticleManageController extends GetxController {
  RxList<ArticleListModel> articleList = RxList.empty();
  Rx<ArticleInfoModel> articleInfo = ArticleInfoModel(
          "image",
          "اینجا عنوان مقاله قرار میگیره یه عنوان جذاب انتخاب کن",
          "من متن بدنه اصلی هستم اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی نوشته ابی رنگ بالا 'ویرایش متن اصلی مقاله' رو با انگشت لمس کن تا وارد ویرایشگر بشی")
      .obs;
  RxList<TagsModel> tagsList = RxList.empty();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    try {
      isLoading.value = true;
      var response = await DioService().getMethod(
          url:
              // ignore: prefer_interpolation_to_compose_strings
              "${ApiConstant.baseUrl}article/get.php?command=published_by_me&user_id=1"
          // +
          //     GetStorage().read(StorageKey.userIdKey)
          );
      if (response.statusCode == 200) {
        response.data.forEach((element) {
          articleList.add(ArticleListModel.fromjson(element));
        });
        isLoading.value = false;
      }
    } catch (e) {
      log("#Catch get Manage Article => $e");
      showErorrSnackBar(message: 'اتصال اینترنت خود را چک کنید', title: 'خطا');
    }
  }
}
