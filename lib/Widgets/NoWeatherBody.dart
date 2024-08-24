import 'package:flutter/material.dart';


class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Ther is no weather,\n Start searching now',
        style: TextStyle(
          fontSize: 33
        ),
      ),
    );
  }
}
