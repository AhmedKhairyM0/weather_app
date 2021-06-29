import 'package:flutter/material.dart';
import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/screens/location_screen.dart';
import 'screens/loading_screen.dart';

void main() => runApp(ClimaApp());

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingScreen.route,
      routes: {
        LoadingScreen.route: (context) => LoadingScreen(),
        LocationScreen.route: (context) => LocationScreen(),
        CityScreen.route: (context) => CityScreen(),
      },
    );
  }
}
