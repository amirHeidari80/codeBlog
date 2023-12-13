import 'package:flutter_codeblog/components/constants/api_constant.dart';

class ArticleListModel {
  String? id, title, image, catId, catName, author, view, status, createdAt;
  bool? isFavorite;

  ArticleListModel();

  ArticleListModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.domainUrl + element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"] ?? 'امیر حیدری';
    view = element["view"];
    switch (element["status"]) {
      case '0':
        status = 'پیش نویس';
        break;
      case '1':
        status = 'منتشر شده';
        break;
      case '2':
        status = 'در انتظار تایید';
        break;
    }
    createdAt = element["created_at"];
    isFavorite = element["isFavorite"] ?? false;
  }
}
    // 0: 'پیش نویس',
    // 1: 'منتشر شده',
    // 2: 'در انتظار تایید'

            // "id": "1",
            // "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
            // "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
            // "cat_id": "1",
            // "cat_name": "اخبار و مقالات",
            // "author": "بهرام امینی",
            // "view": "3659",
            // "status": "1",
            // "created_at": "۱۴۰۱/۲/۱۶"

        //        "id": "255",
        // "title": "مفهوم  نوآوری باز",
        // "image": "/Techblog/assets/upload/images/article/20231114102501.jpg",
        // "cat_id": "4",
        // "cat_name": "سخت افزار",
        // "author": "''",
        // "view": "21",
        // "status": "0",
        // "isFavorite": false,
        // "created_at": "۱۴۰۲/۸/۲۳"