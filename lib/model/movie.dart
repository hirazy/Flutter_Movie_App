import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie{

  const Movie._();

  @JsonSerializable(explicitToJson: true)
  const factory Movie({
    required String name,
    int? age,
  }) = _Movie;

  factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);
  
} 