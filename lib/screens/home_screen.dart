import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:weather24/controller/global_controller.dart';
import 'package:weather24/widgets/comport_level.dart';
import 'package:weather24/widgets/current_weather_widget.dart';
import 'package:weather24/widgets/header_widget.dart';
import 'package:weather24/widgets/hourly_data_widget.dart';

import '../utils/coutom_colors.dart';
import '../widgets/daily_data_forcast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalControler globalControler =
      Get.put(GlobalControler(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalControler.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children:  [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                    //  for current temperature
                      CurrentWeatherWidget(
                        weatherDataCurrent: globalControler.getData().getCurrentWeather(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      HourlyDataWidget(weatherDataHourly: globalControler.getData().getHourlyWeather()),
                      DailyDataForcast(
                         weatherDataDaily: globalControler.getData().getDailyWeather(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ComfortLevel(weatherDataCurrent: globalControler.getData().getCurrentWeather())
                    ],
                  ),
              ),
        ),
      ),
    );
  }
}
