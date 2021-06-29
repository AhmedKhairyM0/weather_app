import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/utitilies/post.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String route = '/';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Post? weatherData = await WeatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData: weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: SpinKitPulse(
            size: 150,
            color: Colors.grey[400],
            duration: Duration(seconds: 3),
          ),
        ),
      ),
    );
  }
}