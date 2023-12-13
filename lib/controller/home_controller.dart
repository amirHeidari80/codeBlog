import 'dart:developer';
import 'package:flutter_codeblog/components/constants/api_constant.dart';
import 'package:flutter_codeblog/components/widgets_component.dart';
import 'package:flutter_codeblog/models/podcast_model.dart';
import 'package:flutter_codeblog/models/poster_model.dart';
import 'package:flutter_codeblog/models/tags_model.dart';
import 'package:flutter_codeblog/models/article_list_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<PosterModel> posterItem = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleListModel> topvisitedList = RxList();
  RxList<PodcastModel> podcastList = RxList();

  RxBool isLoading = false.obs;

  getHomeItems() async {
    try {
      isLoading.value = true;
      var response =
          await DioService().getMethod(url: ApiConstant.getHomeItemsUrl);

      if (response.statusCode == 200) {
        // created Top Visited list
        response.data['top_visited'].forEach((element) {
          topvisitedList.add(ArticleListModel.fromjson(element));
        });
        // created Top Podcasts list
        response.data['top_podcasts'].forEach((element) {
          podcastList.add(PodcastModel.fromjson(element));
        });
        // created  posterItem
        posterItem.value = PosterModel.fromjson(response.data['poster']);
        // created Tags List
        response.data['tags'].forEach((element) {
          tagsList.add(TagsModel.fromjson(element));
        });
        isLoading.value = false;
      }
    } catch (e) {
      log("#Catch Get Home Items => $e");
      showCustomSnackBar(message: 'اتصال اینترنت خود را چک کنید', title: 'خطا');
    }
  }
}
