import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/utils/custom_colors.dart';

class HourlyDetails extends StatelessWidget {
  final int temp;
  final int index;
  final int selectedHourIndex;
  final int timeStamp;
  final String icon;

  const HourlyDetails(
      {Key? key,
      required this.temp,
      required this.timeStamp,
      required this.icon,
      required this.index,
      required this.selectedHourIndex})
      : super(key: key);

  String convertFromTimeStampToHour(int timeStamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat.Hm().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            convertFromTimeStampToHour(timeStamp),
            style: TextStyle(
                color: index == selectedHourIndex
                    ? Colors.white
                    : CustomColors.textColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 40,
          width: 40,
          child: Image.asset("assets/weather/$icon.png"),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp°",
            style: TextStyle(
                fontSize: 20,
                color: index == selectedHourIndex
                    ? Colors.white
                    : CustomColors.textColor),
          ),
        )
      ],
    );
  }
}
