class ProductionCountryModel{
  late String iso_3166_1;
  late String name;

  ProductionCountryModel.fromJson(Map<String, dynamic> json){
    iso_3166_1 = json["iso_3166_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = Map();

    json["iso_3166_1"] = iso_3166_1;
    json["name"] = name;
    return json;
  }

  static List<ProductionCountryModel>? fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return ProductionCountryModel.fromJson(item);
    })?.toList();
  }
}