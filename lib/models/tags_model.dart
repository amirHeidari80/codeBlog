class TagsModel {
  String? id, title;

  TagsModel({
    required this.id,
    required this.title,
  });

  TagsModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}


            // "id": "7",
            // "title": "آیفون"
