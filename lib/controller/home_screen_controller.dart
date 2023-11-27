import 'dart:developer';

import 'package:flutter_codeblog/components/api_constant.dart';
import 'package:flutter_codeblog/models/podcast_model.dart';
import 'package:flutter_codeblog/models/poster_model.dart';
import 'package:flutter_codeblog/models/tags_model.dart';
import 'package:flutter_codeblog/models/topvisited_model.dart';
import 'package:flutter_codeblog/service/dio_service.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> posterItem = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<TopVisitedModel> topvisitedList = RxList();
  RxList<PodcastModel> podcastList = RxList();

  RxBool isLoading = false.obs;

  //درخواست دیتا با هربار فراخانی کلاس کنترلر
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    try {
      isLoading.value = true;
      var response =
          await DioService().getMethod(url: ApiConstant.getHomeItemsUrl);

      if (response.statusCode == 200) {
        // created Top Visited list
        response.data['top_visited'].forEach((element) {
          topvisitedList.add(TopVisitedModel.fromjson(element));
        });
        // created Top Podcasts list
        response.data['top_podcasts'].forEach((element) {
          podcastList.add(PodcastModel.fromjsaon(element));
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
    }
  }
}
