import '../model/item_model.dart';
import '../model/movie_detail_model.dart';
import '../model/movie_image_model.dart';
import 'ApiProvider.dart';

class MovieRepository{

 final moviesApiProvider = ApiProvider.internal();

 Future<MovieDetailModel>fetchMovieDetail(int id) => moviesApiProvider.fetchMovieDetail(id);

 Future<MovieImageModel>fetchMovieImages(int id) => moviesApiProvider.fetchMovieImages(id);

 Future<ItemModel>fetchMovieList(String type) => moviesApiProvider.fetchMovieList(type);

}