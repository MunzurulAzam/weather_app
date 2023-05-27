

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather24/model/weather_data_hourly.dart';
import 'package:weather24/utils/coutom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;

  const HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20,),
          alignment: Alignment.topCenter,
          child: const Text(
            "Today",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),

        // hourlyList(),

      ],
    );
  }

//   Widget hourlyList(){
//     return Container(
//       height: 150,
//       padding: EdgeInsets.only(top: 10, bottom: 10,),
//       child: ListView.builder(
//         itemCount: weatherDataHourly.hourly.length > 12 ? 12: weatherDataHourly.hourly.length ,
//         itemBuilder: (context, index){
//           return Obx(((() => GestureDetector(child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//                 CustomColors.firstGradientColor,
//                 CustomColors.secondGradientColor,
//               ])
//             ),
//           )))));
//         },
//       ),
//
//     );
//   }
//
}


