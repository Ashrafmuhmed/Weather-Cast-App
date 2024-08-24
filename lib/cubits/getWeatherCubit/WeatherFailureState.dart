import 'package:weather_cast_app/cubits/getWeatherCubit/WeatherState.dart';

class Weatherfailurestate extends Weatherstate {
  final String message;

  Weatherfailurestate({required this.message});
}
