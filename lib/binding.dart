import 'package:flutter_codeblog/controller/home_controller.dart';
import 'package:flutter_codeblog/controller/info_article_controller.dart';
import 'package:flutter_codeblog/controller/list_article_controller.dart';
import 'package:flutter_codeblog/controller/regester_controller.dart';
import 'package:get/get.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListArticleController());
    Get.lazyPut(() => InfoArticleController());
  }
}

class RegesterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegesterController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController(), permanent: false);
    Get.lazyPut(() => HomeController());
  }
}
