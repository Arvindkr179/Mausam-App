import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mausam/bloc/weather_bloc.dart';
import 'package:mausam/data/my_data.dart';
import 'package:weather/weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.3 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                  alignment: const AlignmentDirectional(0, -1.3),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(color: Colors.blue),
                  )),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 90.0, sigmaY: 90.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                  )),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    String gt;
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' ${state.weather.areaName}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                Text(
                                  getGreet(state.weather.date!),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Image.asset(
                                    "assets/${getweather(state.weather.weatherConditionCode!)}.png"),
                                Center(
                                  child: Text(
                                      "${state.weather.temperature!.celsius!.round()}˚C",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Center(
                                  child: Text("${state.weather.weatherMain}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    DateFormat("EEEE dd/MM/yyyy")
                                        .format(state.weather.date!),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/11.png",
                                          scale: 9,
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sunrise",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              DateFormat()
                                                  .add_jm()
                                                  .format(state.weather.sunrise!),
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 82, 73, 73),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/12.png",
                                          scale: 9,
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sunset",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              DateFormat()
                                                  .add_jm()
                                                  .format(state.weather.sunset!),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/13.png",
                                          scale: 9,
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Max Temp",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              "${state.weather.tempMax!.celsius!.round()}˚C",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/14.png",
                                          scale: 9,
                                        ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Min Temp",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              "${state.weather.tempMin!.celsius!.round()}˚C",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ]),
                        ));
                  } else {
                    return Scaffold();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
