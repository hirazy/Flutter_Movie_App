import 'package:movie_app/data/model/base_model.dart';
import 'package:movie_app/data/model/genre_model.dart';
import 'package:movie_app/data/model/production_company_model.dart';
import 'package:movie_app/data/model/production_country_model.dart';
import 'package:movie_app/data/model/spoken_language.dart';

import 'belong_to_collection_model.dart';

class MovieDetailModel extends BaseModel{
  late bool adult;
  late String backdrop_path;
  late BelongToCollectionModel belongs_to_collection;
  late int budget;

  late List<GenreModel> genres;
  late String homepage;
  late int id;
  late String imdb_id;
  late String original_language;
  late String original_title;
  late String overview;
  late double popularity;
  late String poster_path;
  late List<ProductionCompanyModel> production_companies;

  late List<ProductionCountryModel> production_countries;

  late String release_date;
  late int revenue;
  late int runtime;
  late List<SpokenLanguage> spoken_languages;

  late String status;
  late String tagline;
  late String title;
  late String video;
  late double vote_average;
  late int vote_count;

  MovieDetailModel.fromJson(Map<String, dynamic> parsedJson) {
    adult = parsedJson['adult'];
    backdrop_path = parsedJson['backdrop_path'];
    belongs_to_collection = BelongToCollectionModel.fromJson(parsedJson['belongs_to_collection']);
    budget = parsedJson['budget'];
    genres = GenreModel.fromJsonArray(parsedJson["genres"])!;
    homepage = parsedJson['homepage'];
    id = parsedJson['id'];
    imdb_id = parsedJson['imdb_id'];
    original_language = parsedJson['original_language'];
    original_title = parsedJson['original_title'];
    overview = parsedJson['overview'];
    popularity = parsedJson['popularity'];
    poster_path = parsedJson['poster_path'];
    production_companies = ProductionCompanyModel.fromJsonArray(parsedJson['production_companies'])!;
    production_countries = ProductionCountryModel.fromJsonArray(parsedJson['production_countries'])!;
    release_date = parsedJson['release_date'];
    revenue = parsedJson['revenue'];
    runtime = parsedJson['runtime'];
    spoken_languages = SpokenLanguage.fromJsonArray(parsedJson['spoken_languages']);
    status = parsedJson['status'];
    tagline = parsedJson['tagline'];
    title = parsedJson['title'];
    video = parsedJson['video'];
    vote_average = parsedJson['vote_average'];
    vote_count = parsedJson['vote_count'];
  }

}