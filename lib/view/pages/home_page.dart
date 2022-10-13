import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/view/pages/search_page.dart';
import 'package:weather_app/view/widget/home_page/empty_search_widget.dart';
import 'package:weather_app/view/widget/home_page/weather_container_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    weatherProvider = Provider.of<WeatherProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const SearchScreen()),
                      ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: weatherProvider.weatherModel == null
            ? const EmptySearchWidget()
            : WeatherContainerWidget());
  }
}
