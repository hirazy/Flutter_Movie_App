import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ImageModel{

  late double aspect_ratio;
  late int height;
  late String iso_639_1;
  late String file_path;
  late double vote_average;
  late int vote_count;
  late int width;

  // ImageModel({
  //   required this.aspect_ratio,
  //   required this.height,
  //   required this.iso_639_1,
  //   required this.file_path,
  //   required this.vote_average,
  //   required this.vote_count,
  //   required this.width
  // })
  //
  ImageModel.fromJson(Map<String, dynamic> json){
    aspect_ratio = json["aspect_ratio"];
    height = json["height"];
    iso_639_1 = json["iso_639_1"] ?? "";
    file_path = json["file_path"];
    vote_average = json["vote_average"];
    vote_count = json["vote_count"];
    width = json["width"];
  }

  static List<ImageModel>? fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return ImageModel.fromJson(item);
    })?.toList();
  }
}