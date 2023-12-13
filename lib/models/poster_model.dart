import 'package:flutter_codeblog/components/constants/api_constant.dart';

class PosterModel {
  String? id, title, image;

  PosterModel();

  PosterModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.domainUrl + element["image"];
  }
}

        // "id": "16",
        // "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
        // "image": "/Techblog/assets/upload/images/article/20220904181457.jpg"