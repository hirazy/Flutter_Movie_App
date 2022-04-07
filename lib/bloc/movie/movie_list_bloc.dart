import 'package:movie_app/bloc/base_bloc.dart';
import 'package:movie_app/data/model/item_model.dart';

class MovieListBloc extends BaseBloc<ItemModel>{

  Stream<ItemModel> get movieList => fetcher.stream;

  fetchMovieList(String type) async{
    ItemModel itemModel = await repository.fetchMovieList(type);
    fetcher.sink.add(itemModel);
  }

}

final movieListBloc = MovieListBloc();