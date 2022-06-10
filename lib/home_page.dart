import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/common/app_colors.dart';
import 'package:gale/scenes/theme/theme_bloc/theme_bloc.dart';
import 'package:gale/scenes/weather_bloc/weather_bloc.dart';
import 'package:gale/scenes/weather_forecast_bloc/weather_forecast_bloc.dart';
import 'package:gale/scenes/widgets/weather_error_widget.dart';
import 'package:gale/scenes/widgets/weather_has_data_widget.dart';
import 'package:gale/scenes/widgets/weather_initial_widget.dart';
import 'package:gale/scenes/widgets/weather_loading_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cityTextController = TextEditingController();
  double opacity = 0;
  double height = 0;
  String country = '';
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            children: [
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('$country, ',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.blackTextColor,
                          fontWeight: FontWeight.bold)),
                  Text(cityName,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.blackTextColor,
                          fontWeight: FontWeight.w400)),
                  Container(
                      margin: const EdgeInsets.only(left: 2.5),
                      child: InkWell(
                          child: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.blackTextColor),
                          onTap: () async {
                            if (height == 45) {
                              setState(() {
                                opacity = 0;
                              });
                              await Future.delayed(
                                  const Duration(milliseconds: 325));
                              setState(() {
                                height = 0;
                              });
                            } else {
                              setState(() {
                                height = 45;
                              });
                              await Future.delayed(
                                  const Duration(milliseconds: 325));
                              setState(() {
                                opacity = 1;
                              });
                            }
                          }))
                ]),
                AnimatedContainer(
                    curve: Curves.easeInQuad,
                    margin: const EdgeInsets.only(top: 10, right: 15, left: 15),
                    height: height,
                    decoration: BoxDecoration(
                        color: AppColors.whiteTextColor,
                        borderRadius: BorderRadius.circular(15)),
                    duration: const Duration(milliseconds: 325),
                    child: TextFormField(
                        onEditingComplete: () {
                          if (_cityTextController.text.isNotEmpty) {
                            context.read<ThemeBloc>().add(ThemeCityEvent(city: _cityTextController.text));
                            context.read<WeatherBloc>().add(WeatherCityEvent(city: _cityTextController.text));
                            context.read<WeatherForecastBloc>().add(WeatherForecastCityEvent(city: _cityTextController.text));
                            _cityTextController.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                          } else {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                        controller: _cityTextController,
                        decoration: InputDecoration(
                            hintText: "Search for Location",
                            hintStyle: GoogleFonts.poppins(),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 11.5),
                            border: InputBorder.none,
                            suffixIcon: AnimatedOpacity(
                              duration: const Duration(milliseconds: 325),
                              curve: Curves.easeInQuad,
                              opacity: opacity,
                              child: InkWell(
                                  child: Icon(Icons.search,
                                      color: AppColors.greyTextColor),
                                  onTap: () {
                                    if (_cityTextController.text.isNotEmpty) {
                                      context.read<ThemeBloc>().add(ThemeCityEvent(city: _cityTextController.text));
                                      context.read<WeatherBloc>().add(WeatherCityEvent(city: _cityTextController.text));
                                      context.read<WeatherForecastBloc>().add(WeatherForecastCityEvent(city: _cityTextController.text));
                                      _cityTextController.clear();
                                    }
                                  }),
                            ))))
              ])),
          BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {
            if (state is WeatherHasDataState) {
              setState(() {
                country = state.weather.sys!.country.toString();
                cityName = state.weather.name.toString();
              });
            }
          }, builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const WeatherLoadingWidget();
            } else if (state is WeatherHasDataState) {
              return WeatherHasDataWidget(
                state: state,
              );
            } else if (state is WeatherErrorState) {
              return WeatherErrorWidget(state: state);
            } else {
              return const WeatherInitialWidget();
            }
          })
        ]),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30, right: 5),
          child: InkWell(
              child: const Icon(Icons.location_searching,
                  size: 32, color: AppColors.blackTextColor),
              onTap: () {
                context.read<WeatherBloc>().add(WeatherStartupEvent());
                context.read<ThemeBloc>().add(ThemeStartupEvent());
                context.read<WeatherForecastBloc>().add(WeatherForecastStartupEvent());
              }),
        ));
  }
}
