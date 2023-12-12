import 'package:flutter_codeblog/components/api_constant.dart';

class PodcastModel {
  String? id, title, poster, catName, author, view, status, createdAt;

  PodcastModel();

  PodcastModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiConstant.domainUrl + element["poster"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}

// "id": "33",
// "title": "رادیوگیک ۱۴۳ – عاشقتم",
// "poster": "''",
// "cat_name": "اخبار و مقالات",
// "author": "ساسان صفری",
// "view": "24",
// "status": "0",
// "created_at": "۱۴۰۲/۶/۲۷"
