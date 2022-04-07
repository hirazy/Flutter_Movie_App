class GenreModel {
  late int id;
  late String name;

  GenreModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["name"] = name;
    return map;
  }

  static List<GenreModel>? fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return GenreModel.fromJson(item);
    })?.toList();
  }
}
