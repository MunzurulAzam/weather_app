import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather24/model/weather_data_daily.dart';
import 'package:weather24/utils/coutom_colors.dart';

class DailyDataForcast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyDataForcast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  // String manipulate

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      //put another container into exting container
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 10),
            child: const Text("Next Day",
                style: TextStyle(
                  color: CustomColors.textColorBlack,
                  fontSize: 17,
                )),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          getDay(weatherDataDaily.daily[index].dt),
                          style: TextStyle(
                            color: CustomColors.textColorBlack,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text("${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°")
                    ],
                  )),
              Container(
                 height: 1,
                color: CustomColors.dividerLine,
              ),
            ],
          );
        },
      ),
    );
  }
}
