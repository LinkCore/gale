import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../weather_bloc/weather_bloc.dart';

class WeatherErrorWidget extends StatelessWidget {
  final WeatherErrorState state;
  final TextEditingController cityTextController;

  const WeatherErrorWidget(
      {Key? key, required this.state, required this.cityTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Error ${state.errorCode}'),
      Row(children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(border: InputBorder.none),
                    controller: cityTextController))),
        Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: IconButton(
                color: Colors.red,
                icon: const Icon(Icons.search, color: Colors.black87, size: 26),
                onPressed: () {
                  if (cityTextController.text.isNotEmpty) {
                    context
                        .read<WeatherBloc>()
                        .add(WeatherCityEvent(city: cityTextController.text));
                    cityTextController.clear();
                  }
                }))
      ])
    ]));
  }
}
