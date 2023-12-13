import 'package:flutter_codeblog/controller/article/article_manage_controller.dart';
import 'package:flutter_codeblog/controller/home_controller.dart';
import 'package:flutter_codeblog/controller/article/article_info_controller.dart';
import 'package:flutter_codeblog/controller/article/article_list_controller.dart';
import 'package:flutter_codeblog/controller/regester_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class RegesterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegesterController());
  }
}

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleListController());
    Get.lazyPut(() => ArticleInfoController());
  }
}

class ArticleManageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleManageController());
  }
}
