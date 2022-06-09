import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/scenes/widgets/weather_loading_widget.dart';

import '../../common/app_colors.dart';
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
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
            children: [
          Container(
              height: MediaQuery.of(context).size.height/4.5,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
              decoration: BoxDecoration(
                  color: AppColors.cartColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(imageUrl: widget.state.weather.iconUrl,width: 115,height: 115),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(widget.state.weather.weather!.first.description.toString(),
                                style: GoogleFonts.poppins(
                                    color: AppColors.whiteTextColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ]),
                    const Spacer(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.state.weather.main!.temp.toString()}°',
                              style: GoogleFonts.poppins(
                                  color: AppColors.whiteTextColor,
                                  fontSize: 80,
                                  fontWeight: FontWeight.w600)),
                          Text(
                              'Feels like  ${widget.state.weather.main!.feelsLike.toString()}°',
                              style: GoogleFonts.poppins(
                                  color: AppColors.whiteTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16))
                        ])
                  ])),
          Container(
              height: MediaQuery.of(context).size.height/7,
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('Wind',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGreyTextColor,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 10),
                      Text('${widget.state.weather.wind!.speed.toString()} m/s',
                          style: GoogleFonts.poppins(
                              color: AppColors.greyTextColor,
                              fontWeight: FontWeight.w700))
                    ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('Humidity',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGreyTextColor,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 10),
                      Text(
                          '${widget.state.weather.main!.humidity.toString()} %',
                          style: GoogleFonts.poppins(
                              color: AppColors.greyTextColor,
                              fontWeight: FontWeight.w700))
                    ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('Visibility',
                          style: GoogleFonts.poppins(
                              color: AppColors.lightGreyTextColor,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 10),
                      Text('${(widget.state.weather.visibility!/1000).toDouble().toString()} km',
                          style: GoogleFonts.poppins(
                              color: AppColors.greyTextColor,
                              fontWeight: FontWeight.w700))
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
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: state.weatherForecast.forecast!
                        .map((e) => Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Column(
                                  children: [
                                    Text(DateFormat('kk:mm').format(DateTime.parse(e.dtTxt!)), style: GoogleFonts.poppins(color: AppColors.whiteTextColor, fontWeight: FontWeight.w700),),
                                    Text('${e.main!.temp!.toInt().toString()}°', style: GoogleFonts.poppins(color: AppColors.whiteTextColor, fontWeight: FontWeight.w600, fontSize: 26),),
                                    Row(children: e.weather!.map((q) => CachedNetworkImage(imageUrl: 'https://openweathermap.org/img/wn/${q.icon.toString()}@2x.png') ).toList()),
                                    Text('${e.wind!.speed.toString()}'' m/s',style: GoogleFonts.poppins(color: AppColors.whiteTextColor, fontWeight: FontWeight.w500),),
                                  ],),
                                ),
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
