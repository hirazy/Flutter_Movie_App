import 'package:movie_app/data/model/base_model.dart';

import 'image_model.dart';

class MovieImageModel extends BaseModel{

  late int id;
  late List<ImageModel> posters = [];
  late List<ImageModel> backdrops = [];

  MovieImageModel.fromJson(Map<String, dynamic> parsedJson) {

    id = parsedJson['id'];
    posters = ImageModel.fromJsonArray(parsedJson['posters'])!;
    backdrops = ImageModel.fromJsonArray(parsedJson['backdrops'])!;
  }

}