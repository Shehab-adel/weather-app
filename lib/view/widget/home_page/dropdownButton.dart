import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_wodel.dart' as weather;
import 'package:weather_app/provider/weather_provider.dart';

import '../../../services/weather_services.dart';

class DropdownButtonWidget extends StatelessWidget {
  DropdownButtonWidget({
    Key? key,
  }) : super(key: key);
  final List<String> cities = const [
    'القاهرة',
    'العاشر من رمضان',
    'السادس من اكتوبر',
    'ابو المطامير',
    'ابو حمص',
    'الجيزة',
    'القليوبية',
    'المنوفيه',
    'بني سويف',
    'البحر الاحمر',
    'الاسكندرية',
    'مطروح',
    'البحيرة',
    'دمياط',
    'العياط',
    'كفر الشيخ',
    'الغربية',
    'الشرقيه',
    'بور سعيد',
    'واحة الخارجة',
    'السويس',
    'جنوب سينا',
    'شمال سينا',
    'العريش',
    'الفيوم',
    'المنيا',
    'أسيوط',
    'الوادي الجديد',
    'سوهاج',
    'قنا',
    'الأقصر',
    'أسوان',
  ];

  late WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    weatherProvider = Provider.of<WeatherProvider>(context);
    return DropdownButton(
        value: weatherProvider.cityName ?? 'القاهرة',
        items: cities
            .map((e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (String? city) async {
          WeatherServices weatherServices = WeatherServices();
          weather.WeatherModel? weatherModel =
              await weatherServices.getWeather(city, context);
          weatherProvider.changeCityNme(city);
          weatherProvider
              .changeWeatherModel(weatherModel ?? weather.WeatherModel());
          if (weatherModel != null) {
            Navigator.pop(context);
          }
        });
  }
}
