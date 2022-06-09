import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../weather_bloc/weather_bloc.dart';

class WeatherErrorWidget extends StatelessWidget {
  final WeatherErrorState state;

  const WeatherErrorWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          'Error ${state.errorCode}',
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ]),
    );
  }
}
