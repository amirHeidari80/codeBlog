class PosterModel {
  String? id, title, image;

  PosterModel({
    required this.id,
    required this.title,
    required this.image,
  });

  PosterModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}

        // "id": "16",
        // "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
        // "image": "/Techblog/assets/upload/images/article/20220904181457.jpg"