import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../weather_bloc/weather_bloc.dart';

class WeatherHasDataWidget extends StatelessWidget {
  final WeatherHasDataState state;
  final TextEditingController cityTextController;

  const WeatherHasDataWidget(
      {Key? key, required this.state, required this.cityTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFf2f4f7),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 15),
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
          const Spacer(),
          Row(children: [
            const Expanded(child: SizedBox()),
            Container(
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    color: Colors.red,
                    icon: const Icon(Icons.location_searching,
                        color: Colors.black87, size: 26),
                    onPressed: () {
                      context.read<WeatherBloc>().add(WeatherStartupEvent());
                    }))
          ]),
          Row(children: [
            Expanded(
                child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                        onSubmitted: (value) {
                          if (cityTextController.text.isNotEmpty &&
                              value.isNotEmpty) {
                            context
                                .read<WeatherBloc>()
                                .add(WeatherCityEvent(city: value));
                            cityTextController.clear();
                          }
                        },
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        controller: cityTextController))),
            Container(
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    color: Colors.red,
                    icon: const Icon(Icons.search,
                        color: Colors.black87, size: 26),
                    onPressed: () {
                      if (cityTextController.text.isNotEmpty) {
                        context.read<WeatherBloc>().add(
                            WeatherCityEvent(city: cityTextController.text));
                        cityTextController.clear();
                      }
                    }))
          ])
        ]));
  }
}
