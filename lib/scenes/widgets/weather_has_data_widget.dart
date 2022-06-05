import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../weather_bloc/weather_bloc.dart';

class WeatherHasDataWidget extends StatelessWidget {
  final WeatherHasDataState state;

  const WeatherHasDataWidget(
      {Key? key, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFf2f4f7),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                  color: const Color(0xFF5674ff),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(imageUrl: state.weather.iconUrl),
                          Text(
                              state.weather.weather!.first.description
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400))
                        ]),
                    const Spacer(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${state.weather.main!.temp.toString()}°',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.w900)),
                          Text(
                              'Feels like  ${state.weather.main!.feelsLike.toString()}°',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15))
                        ])
                  ])),
          Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Text('Wind',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 10),
                      Text('${state.weather.wind!.speed.toString()} m/s',
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w800))
                    ]),
                    Column(children: [
                      Text('Humidity',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 10),
                      Text('${state.weather.main!.humidity.toString()} %',
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w800))
                    ]),
                    Column(children: [
                      Text('Visibility',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 10),
                      Text('${state.weather.visibility.toString()} m',
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w800))
                    ])
                  ])),
        ]));
  }
}
