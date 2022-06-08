import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/scenes/weather_bloc/weather_bloc.dart';
import 'package:gale/scenes/widgets/weather_error_widget.dart';
import 'package:gale/scenes/widgets/weather_has_data_widget.dart';
import 'package:gale/scenes/widgets/weather_initial_widget.dart';
import 'package:gale/scenes/widgets/weather_loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cityTextController = TextEditingController();
  double height = 0;
  String country = '';
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf2f4f7),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$country, ',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold)),
                    Text(cityName,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400)),
                    Container(
                      margin: const EdgeInsets.only(left: 2.5),
                      child: InkWell(
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black87
                        ),
                        onTap: () {
                          setState(() {
                            if (height == 45) {
                              height = 0;
                            } else {
                              height = 45;
                            }
                          });
                        }
                      )
                    )
                  ]
                ),
                AnimatedContainer(
                  curve: Curves.easeInQuad,
                    margin: const EdgeInsets.only(top: 10, right: 15, left: 15),
                    height: height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    duration: const Duration(milliseconds: 325),
                    child: TextFormField(
                      onEditingComplete: (){if (_cityTextController.text.isNotEmpty) {
                        context.read<WeatherBloc>().add(
                            WeatherCityEvent(
                                city: _cityTextController.text));
                        _cityTextController.clear();
                      }},
                        controller: _cityTextController,
                        decoration: InputDecoration(
                            hintText: "Search for Location",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.5),
                            border: InputBorder.none,
                            suffixIcon: InkWell(
                                child: const Icon(Icons.search,
                                    color: Colors.black87),
                                onTap: () {
                                  if (_cityTextController.text.isNotEmpty) {
                                    context.read<WeatherBloc>().add(
                                        WeatherCityEvent(
                                            city: _cityTextController.text));
                                    _cityTextController.clear();
                                  }
                                }))))
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
              return WeatherErrorWidget(
                  state: state, cityTextController: _cityTextController);
            } else {
              return const WeatherInitialWidget();
            }
          })
        ]
      ),
      floatingActionButton: InkWell(
        child: const Icon(Icons.location_searching),
        onTap: () {
          context.read<WeatherBloc>().add(WeatherStartupEvent());
        }
      )
    );
  }
}
