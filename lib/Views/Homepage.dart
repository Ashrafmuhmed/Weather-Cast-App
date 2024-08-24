import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast_app/Views/SearchView.dart';
import 'package:weather_cast_app/Widgets/NoWeatherBody.dart';
import 'package:weather_cast_app/Widgets/WeahterWidget.dart';
import 'package:weather_cast_app/cubits/ModeCubit/ModeCubit.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/GetWeatherCubit.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/NoWeahterState.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/WeatherState.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/WeatherSuccessfullState.dart';
// import 'package:weather_cast_app/Widgets/WeahterWidget.dart';

// import '../Widgets/WeatherDisplay.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<Modecubit>(context).changeMode();
        },
        child: Image(
          image: AssetImage('assets/images/dark-mode.png'),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Searchview();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text(
          'Weahter App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Colors.green, Colors.lightBlue],
        //         begin: Alignment.bottomLeft,
        //         end: Alignment.topRight)),
        child: BlocBuilder<GetWeatherCubit, Weatherstate>(
          builder: (context, state) {
            if (state is InitialSate)
              return NoWeatherBody();
            else if (state is WeatherSuccessfullState)
              return Weatherdisplay();
            else
              return Text('Oops there was an error...');
          },
        ),
      ),
    );
  }
}


// there are 3 states in the program
// noWeahterState()  + weatherSuccessfullState() + weatherFailureState
