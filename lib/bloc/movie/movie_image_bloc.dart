import '../../data/model/movie_image_model.dart';
import '../base_bloc.dart';

class MovieImageBloc extends BaseBloc<MovieImageModel> {

  Stream<MovieImageModel> get movieImages => fetcher.stream;

  fetchMovieImages(int movieId) async {
    MovieImageModel itemModel = await repository.fetchMovieImages(movieId);
    fetcher.sink.add(itemModel);
  }
}

final movieImageBloc = MovieImageBloc();