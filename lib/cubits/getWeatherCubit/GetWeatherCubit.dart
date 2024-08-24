import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast_app/Models/WeahterModel.dart';
import 'package:weather_cast_app/Services/WeatherService.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/NoWeahterState.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/WeatherFailureState.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/WeatherState.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/WeatherSuccessfullState.dart';

class GetWeatherCubit extends Cubit<Weatherstate> {
  Weahter? weathermodel;
  GetWeatherCubit() : super(InitialSate());

  getWeather({required String value}) async {
    try {
      weathermodel =
          await WeatherService().getWeather(city_name: value);
      emit(WeatherSuccessfullState());
    } on DioException catch (e) {
      emit(Weatherfailurestate(message: e.toString()));
    }
  }
}
