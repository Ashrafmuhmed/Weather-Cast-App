import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/getWeatherCubit/GetWeatherCubit.dart';
import 'package:flutter/material.dart';
// import 'package:weather_cast_app/Widgets/WeatherDisplay.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search City',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(value: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(24),
                suffixIcon: Icon(Icons.search),
                label: Icon(Icons.flag),
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.greenAccent),
                )),
          ),
        ),
      ),
    );
  }
}
