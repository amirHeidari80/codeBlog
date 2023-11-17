class ArticleModel {
  String? id, title, image, catId, catName, author, view, status, createdAt;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  ArticleModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}

            // "id": "1",
            // "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
            // "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
            // "cat_id": "1",
            // "cat_name": "اخبار و مقالات",
            // "author": "بهرام امینی",
            // "view": "3659",
            // "status": "1",
            // "created_at": "۱۴۰۱/۲/۱۶"