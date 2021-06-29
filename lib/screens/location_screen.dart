import 'package:flutter/material.dart';
import 'package:clima_app/utitilies/constant.dart';
import 'package:clima_app/services/weather.dart';
import '../utitilies/post.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  static String route = '/locationScreen';
  final Post? weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String weatherMessage;
  late String weatherIcon;
  late String cityName;

  void updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherMessage = 'Unable to get weather data';
        weatherIcon = 'Error';
        cityName = '';
        return;
      }
      temperature = weatherData?.temperature?.toInt();
      weatherMessage = WeatherModel.getMessage(temperature);

      int condition = weatherData?.condition;
      weatherIcon = WeatherModel.getWeatherIcon(condition);

      cityName = weatherData?.cityName;
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    // Post postData = ModalRoute.of(context)?.settings.arguments as Post;
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double ratio = deviceWidth / deviceHeight;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    child: Icon(
                      Icons.near_me_rounded,
                      size: 60 * ratio,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      Post weatherData =
                          await WeatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                  ),
                  TextButton(
                    child: Icon(
                      Icons.location_city_rounded,
                      size: 60 * ratio,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      var typedText = await Navigator.push(context,
                          MaterialPageRoute(builder: (c) {
                        return CityScreen();
                      }));
                      if (typedText != null) {
                        Post weatherData =
                            await WeatherModel.getCityWeather(typedText);
                        updateUI(weatherData);
                      }
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Text(
                      '$temperature°',
                      style: kTextStyle,
                    ),
                  ),
                  Text(
                    weatherIcon,
                    style: TextStyle(
                        color: Colors.yellowAccent, fontSize: 160 * ratio),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  style: kTextStyle.copyWith(fontSize: 80 * ratio),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
