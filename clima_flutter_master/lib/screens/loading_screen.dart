import 'dart:convert';

import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  void getCurrentLocationData() async {
    Location l = Location();
    await l.getLocation();
    // if using a function or property, put inside ${}
    print('latitude: ${l.latitude}, longitude: ${l.longitude}');
    latitude = l.latitude;
    longitude = l.longitude;
    final urlToGetThWeather = makeCustomWeatherURL(
        latitude.toString(), longitude.toString(), kWeatherUrl, kApiKey);

    NetworkHelper nh = NetworkHelper(url: urlToGetThWeather);
    var weatherData = await nh.getData();
  }

  String makeCustomWeatherURL(
      String latitude, String longitude, String baseURL, String apiKey) {
    final sb = StringBuffer(baseURL);
    sb..write('lat=${latitude}&lon=${longitude}&appid=${apiKey}');
    return sb.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
