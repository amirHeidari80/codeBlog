class TagsModel {
  String? id, title;

  TagsModel();

  TagsModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}


            // "id": "7",
            // "title": "آیفون"
