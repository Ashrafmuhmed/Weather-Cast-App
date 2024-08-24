import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast_app/cubits/ModeCubit/DarkMode.dart';
import 'package:weather_cast_app/cubits/ModeCubit/LightMode.dart';
import 'package:weather_cast_app/cubits/ModeCubit/ModeState.dart';

class Modecubit extends Cubit<Modestate> {
  Modecubit() : super(Lightmode());
  bool f = true;
  changeMode() {
    if (f) {
      f = !f;
      emit(Darkmode());
    } else {
      f = !f;
      return emit(Lightmode());
    }
  }
}
