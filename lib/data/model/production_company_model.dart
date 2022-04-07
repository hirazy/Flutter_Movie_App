import 'package:movie_app/data/model/base_model.dart';

class ProductionCompanyModel extends BaseModel {
  late String id;
  late String logo_path;
  late String name;
  late String origin_country;

  ProductionCompanyModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    logo_path = json["logo_path"];
    name = json["name"];
    origin_country = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json["id"] = id;
    json["logo_path"] = logo_path;
    json["name"] = name;
    json["origin_country"] = origin_country;
    return json;
  }

  static List<ProductionCompanyModel>? fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return ProductionCompanyModel.fromJson(item);
    })?.toList();
  }
}