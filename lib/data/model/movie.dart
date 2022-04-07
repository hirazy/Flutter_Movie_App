import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Movie{

  late int _vote_count;
  late int _id;
  late bool _video;
  late String _vote_average;
  late String _title;
  late double _popularity;
  late String _poster_path;
  late String _original_language;
  late String _original_title;
  late List<int> _genre_ids = [];
  late String _backdrop_path;
  late bool _adult;
  late String _overview;
  late String _release_date;

  // @JsonSerializable(explicitToJson: true)
  // const factory Movie({
  //   required String name,
  //   int? age,
  // }) = _Movie;

  Movie.fromJson(Map<String,dynamic> result){
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'].toString();
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  // Map<String, dynamic> toJson() => _$MovieToJson(this);

} 