import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast_app/cubits/getWeatherCubit/GetWeatherCubit.dart';

import '../Models/WeahterModel.dart';

class Weatherdisplay extends StatelessWidget {
  const Weatherdisplay({super.key});

  @override
  Widget build(BuildContext context) {
    Weahter weather = BlocProvider.of<GetWeatherCubit>(context).weathermodel!;
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${weather.city_name!}, ${weather.coun_name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              textAlign: TextAlign.center,
            ),
            Text(
              'Updated at ${weather.lastUpated.hour}:${weather.lastUpated.minute}',
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                Image.network(weather.icon!.contains('http:')
                    ? weather.icon!
                    : 'http:${weather.icon}'),
                Spacer(),
                Text(
                  weather.temp.toString(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Column(
                  children: [
                    Text('maxtemp:${weather.maxtemp.floor()}'),
                    Text('mintemp:${weather.mintemp.floor()}'),
                  ],
                ),
                Spacer(),
              ],
            ),
            Text(
              weather.condition!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  DateTime stringToDateTime(String value) {
    return DateTime.parse(value);
  }
}
