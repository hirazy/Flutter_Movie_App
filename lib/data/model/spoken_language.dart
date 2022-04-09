class SpokenLanguage {
  late String english_name;
  late String iso_639_1;
  late String name;

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    english_name = json["english_name"];
    iso_639_1 = json["iso_639_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json["english_name"] = english_name;
    json["iso_639_1"] = iso_639_1;
    json["name"] = name;
    return json;
  }

  static List<SpokenLanguage>? fromJsonArray(List parsedJson) {
    return parsedJson?.map((item) {
      return SpokenLanguage.fromJson(item);
    })?.toList();
  }
}
