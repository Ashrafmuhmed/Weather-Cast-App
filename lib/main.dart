import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast_app/Views/IntroSlider.dart';
import 'package:weather_cast_app/cubits/ModeCubit/LightMode.dart';
import 'package:weather_cast_app/cubits/ModeCubit/ModeCubit.dart';
import 'package:weather_cast_app/cubits/ModeCubit/ModeState.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/GetWeatherCubit.dart';
// import 'package:weather_cast_app/SearchView.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => Modecubit(),
    child: BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<Modecubit, Modestate>(
        builder: (context, state) {
          return Builder(
            builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state is Lightmode ? ThemeData.light() : ThemeData.dark(),
              home: const IntroScreen(),
            ),
          );
        },
      ),
    ),
  ));
}
