import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/scenes/widgets/weather_loading_widget.dart';

import '../weather_bloc/weather_bloc.dart';
import '../weather_forecast_bloc/weather_forecast_bloc.dart';

class WeatherHasDataWidget extends StatefulWidget {
  final WeatherHasDataState state;

  const WeatherHasDataWidget({Key? key, required this.state}) : super(key: key);

  @override
  State<WeatherHasDataWidget> createState() => _WeatherHasDataWidgetState();
}

class _WeatherHasDataWidgetState extends State<WeatherHasDataWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFf2f4f7),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                          CachedNetworkImage(
                              imageUrl: widget.state.weather.iconUrl),
                          Text(
                              widget.state.weather.weather!.first.description
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
                          Text('${widget.state.weather.main!.temp.toString()}°',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.w900)),
                          Text(
                              'Feels like  ${widget.state.weather.main!.feelsLike.toString()}°',
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
                      Text('${widget.state.weather.wind!.speed.toString()} m/s',
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
                      Text(
                          '${widget.state.weather.main!.humidity.toString()} %',
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
                      Text('${widget.state.weather.visibility.toString()} m',
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w800))
                    ])
                  ])),
          BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
              builder: (context, state) {
            if (state is WeatherForecastLoadingState) {
              return const WeatherLoadingWidget();
            } else if (state is WeatherForecastHasDataState) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: state.weatherForecast.forecast!
                        .map((e) => Column(
                              children: [
                                // Container(
                                //   child: Column(children: [
                                //     Text(DateFormat('kk:mm').format(DateTime.parse(e.dtTxt!))),
                                //     Text('${e.main!.temp!.toInt().toString()}°'),
                                //     CachedNetworkImage(imageUrl: e.weather!.first.toString()),
                                //     Text('${e.wind!.speed.toString()}'' m/s'),
                                //   ],),
                                // ),
                                Container(margin: const EdgeInsets.symmetric(horizontal: 5),child: Text( DateFormat('kk:mm').format(DateTime.parse(e.dtTxt!)))),
                                Container(margin: const EdgeInsets.symmetric(horizontal: 5),child: Text('${e.main!.temp!.toInt().toString()}°')),
                                Container(margin: const EdgeInsets.symmetric(horizontal: 5),child: Row(children: e.weather!.map((q) => CachedNetworkImage(imageUrl: 'https://openweathermap.org/img/wn/${q.icon.toString()}@2x.png') ).toList())),
                                Container(margin: const EdgeInsets.symmetric(horizontal: 5),child: Text('${e.wind!.speed.toString()}'' m/s'))
                              ],
                            ))
                        .toList(),
                  ),
                ),
              );
            } else if (state is WeatherForecastErrorState) {
              return Text(state.errorCode);
            } else {
              return const Text("Error");
            }
          })
        ]));
  }
}
