import 'package:dio/dio.dart';
import 'package:weather_cast_app/Models/WeahterModel.dart';

class WeatherService {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '5de8009ef556411798e214825242108';
  final Dio dio = Dio();
  Future<Weahter> getWeather({required String city_name}) async {
    try {
      Response res = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$city_name&days=1&aqi=no&alerts=no');
      Map<dynamic, dynamic> data = res.data;
      return Weahter.fromJson(data);
    } on DioException catch (e) {
      String? errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception();
    }
  }
}
