import 'package:freezed_annotation/freezed_annotation.dart';


@freezed
abstract class MovieState
{

}

class WeatherInitial extends MovieState {
  WeatherInitial();
}

class WeatherLoading extends MovieState {
  WeatherLoading();
}

class Weather{

}

class WeatherLoaded extends MovieState {
  final Weather weather;

  WeatherLoaded({required this.weather});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}
