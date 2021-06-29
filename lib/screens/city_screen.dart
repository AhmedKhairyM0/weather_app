import 'package:clima_app/utitilies/constant.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  static String route = '/cityScreen';
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var _controller;
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double ratio = deviceWidth / deviceHeight;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/city_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.9),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 60 * ratio,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(20),
                child: buildSearchCity(),
              ),
            ),
            TextButton(
              child: Text(
                'Get Weather',
                style: kTextStyle.copyWith(fontSize: 30),
              ),
              onPressed: () {
                Navigator.pop(context, cityName);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchCity() {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        icon: Icon(
          Icons.location_city_rounded,
          color: Colors.white,
        ),
        hintText: 'Enter city name',
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (value) => cityName = value,
    );
  }
}
