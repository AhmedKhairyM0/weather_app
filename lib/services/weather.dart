import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:clima_app/utitilies/post.dart';

const String openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
const String apiKey = '34aad44716127c44d465aeefc455b1e4';

class WeatherModel {
  static Future<Post> getCityWeather(String cityName) async{
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherUrl?q=$cityName&units=metric&appid=$apiKey');
    return await networkHelper.getData();
  }

  static Future<Post> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300)
      return '๐ฉ';
    else if (condition < 400)
      return '๐ง';
    else if (condition < 600)
      return 'โ';
    else if (condition < 700)
      return 'โ';
    else if (condition < 800)
      return '๐ซ';
    else if (condition == 800)
      return 'โ';
    else if (condition <= 804)
      return 'โ';
    else
      return '๐คท';
  }

  static String getMessage(int temperature) {
    if (temperature > 30)
      return 'It\'s ๐ฆ time';
    else if (temperature > 20)
      return 'Time for shorts and ๐';
    else if (temperature > 15)
      return 'You\'ll need ๐งค and ๐งฃ';
    else
      return 'Bring a ๐งฅ just in case';
  }
}