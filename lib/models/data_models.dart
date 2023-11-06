class Hashtak {
  String? title;

  Hashtak({required this.title});
}

class BlogModel {
  int? id;
  String imageUrl, title, writer, writerImageUrl, date, content, views;
  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writer,
    required this.writerImageUrl,
    required this.date,
    required this.content,
    required this.views,
  });
}
