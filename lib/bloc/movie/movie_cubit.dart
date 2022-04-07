import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/screen/home/home_state.dart';

import '../../data/remote/MovieRepository.dart';

class MovieCubit extends Cubit<MovieState>{
  MovieCubit(MovieState initialState) : super(initialState);


  Future<void> getMovie() async{
    // emit(MovieState());
  }
}

// class MovieCubit extends Cubit<MovieState>{
//   MovieCubit({required this._movieRepository}) : super(HomeState.loading());
//
//   final MovieRepository _movieRepository;
//
//   Future<void> getMovie(){
//     try {
//       emit(WeatherLoading());
//       final weather = await _movieRepository.fet(cityName);
//       emit(WeatherLoaded(weather));
//     } on NetworkException {
//       emit(WeatherError("Couldn't fetch weather. Is the device online?"));
//     }
//   }
// }