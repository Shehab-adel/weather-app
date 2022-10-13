import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_wodel.dart' as weather;
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/view/widget/home_page/dropdownButton.dart';

class SearchTextForm extends StatelessWidget {
  SearchTextForm({Key? key}) : super(key: key);

  late WeatherProvider weatherProvider;
  DropdownButtonWidget dropdownButtonWidget = DropdownButtonWidget();
  bool isFound = false;

  @override
  Widget build(BuildContext context) {
    weatherProvider = Provider.of<WeatherProvider>(context);
    return TextField(
      onSubmitted: (city) async {
        city = city.trim();
        for (int i = 0; i < dropdownButtonWidget.cities.length; i++) {
          if (city == dropdownButtonWidget.cities[i]) {
            isFound = true;
            break;
          }
        }
        if (isFound == true) {
          WeatherServices weatherServices = WeatherServices();
          weather.WeatherModel? weatherModel =
              await weatherServices.getWeather(city, context);
          weatherProvider.changeCityNme(city);
          weatherProvider
              .changeWeatherModel(weatherModel ?? weather.WeatherModel());
          if (weatherModel != null) {
            Navigator.pop(context);
          }
        } else {
          city = "القاهرة";
          open(context);
          WeatherServices weatherServices = WeatherServices();
          weather.WeatherModel? weatherModel =
              await weatherServices.getWeather(city, context);
          weatherProvider.changeCityNme(city);
          weatherProvider
              .changeWeatherModel(weatherModel ?? weather.WeatherModel());
          if (weatherModel != null) {
            Navigator.pop(context);
          }
        }
      },
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.blue,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          suffixIcon: DropdownButtonWidget(),
          hintText: weatherProvider.cityName ?? 'اختار مدينتك',
          label: Text(weatherProvider.cityName ?? "القاهرة"),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 5.0),
          ),
          contentPadding: const EdgeInsets.all(35),
          hintStyle: const TextStyle(
              color: Colors.black45, fontSize: 18, fontWeight: FontWeight.w500),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }

  void open(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'خطا في اختيار المدينة',
      desc:
          ' قم بكتابة اسم المدينة بطريقة صحيحة او اختيارها من صندوق الاختيار اسهل وفي حالة اختيار المدينة بشكل خاطيء سيقوم التطبيق بختيار مدينة القاهرة ',
      onDismissCallback: ((type) => Navigator.pop(context)),
      btnOkOnPress: () {},
      dismissOnTouchOutside: true,
    ).show();
  }
}
