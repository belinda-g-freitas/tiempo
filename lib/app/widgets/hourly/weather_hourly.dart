import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tiempo/app/widgets/status/status_data.dart';
import 'package:tiempo/app/widgets/status/status_weather.dart';
import 'package:tiempo/main.dart';

class WeatherHourly extends StatefulWidget {
  const WeatherHourly({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
    required this.timeDay,
    required this.timeNight,
  });
  final String time;
  final String timeDay;
  final String timeNight;
  final int weather;
  final double degree;

  @override
  State<WeatherHourly> createState() => _WeatherHourlyState();
}

class _WeatherHourlyState extends State<WeatherHourly> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              statusData.getTimeFormat(widget.time),
              style: textTheme.labelLarge,
            ),
            Text(
              DateFormat('E', locale.languageCode)
                  .format(DateTime.tryParse(widget.time)!),
              style: textTheme.labelLarge?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Image.asset(
          statusWeather.getImageToday(
            widget.weather,
            widget.time,
            widget.timeDay,
            widget.timeNight,
          ),
          scale: 3,
        ),
        Text(
          statusData.getDegree(widget.degree.round()),
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
