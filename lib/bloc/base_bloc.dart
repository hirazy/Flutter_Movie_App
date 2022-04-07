import 'package:movie_app/data/model/base_model.dart';
import 'package:movie_app/data/remote/MovieRepository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel>{
  final repository = MovieRepository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}