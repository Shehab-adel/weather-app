import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class WeatherContainerWidget extends StatelessWidget {
  WeatherContainerWidget({Key? key}) : super(key: key);
  late WeatherProvider weatherProvider;
  var forecastDay;

  @override
  Widget build(BuildContext context) {
    weatherProvider = Provider.of<WeatherProvider>(context);
    forecastDay = weatherProvider.weatherModel?.forecast?.forecastday![0];
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.orange],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          weatherProvider.cityName ??
              weatherProvider.weatherModel?.location?.name ??
              '',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          "update: ${forecastDay?.date ?? ''}",
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              getImage(),
              scale: 1.0,
            ),
            Text(
              forecastDay?.day?.avgtempC?.toInt().toString() ?? '',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text('maxTemp: ${forecastDay?.day?.maxtempC?.toInt()} '),
                Text('MinTemp: ${forecastDay?.day?.mintempC?.toInt()}')
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          forecastDay?.day?.condition?.text ?? '',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  String getImage() {
    String? weatherStateName = forecastDay?.day?.condition?.text;
    if (weatherStateName == 'Thundery') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
