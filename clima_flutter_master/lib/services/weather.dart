import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 18) {
      return 'Time for shorts and 👕';
    } else if (temp > 10 && temp <= 18) {
      return 'Bring a 🧥 just in case';
    } else {
      return 'You\'ll need 🧣 and 🧤';
    }
  }

  Future<dynamic> getWeatherByCityName(String cityName) async {
    String urlToGetThWeather =
        makeCustomWeatherURLFromCityName(cityName, kWeatherUrl, kApiKey);
    NetworkHelper nh = NetworkHelper(url: urlToGetThWeather);
    var weatherData = await nh.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location l = Location();
    await l.getLocation();
    // if using a function or property, put inside ${}
    print('latitude: ${l.latitude}, longitude: ${l.longitude}');
    final urlToGetThWeather = makeCustomWeatherURL(
        l.latitude.toString(), l.longitude.toString(), kWeatherUrl, kApiKey);

    NetworkHelper nh = NetworkHelper(url: urlToGetThWeather);
    var weatherData = await nh.getData();
    return weatherData;
  }

  String makeCustomWeatherURL(
      String latitude, String longitude, String baseURL, String apiKey) {
    final sb = StringBuffer(baseURL);
    sb..write('lat=${latitude}&lon=${longitude}&appid=${apiKey}&units=metric');
    print(sb.toString());
    return sb.toString();
  }

  String makeCustomWeatherURLFromCityName(
      String cityName, String baseURL, String apiKey) {
    final sb = StringBuffer(baseURL);
    sb..write('q=${cityName}&appid=${apiKey}&units=metric');
    print(sb.toString());
    return sb.toString();
  }
}
