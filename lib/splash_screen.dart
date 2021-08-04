import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather_app.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? latValue;
  double? longValue;
  String appId = "8e1c4f4901119ddfbab88cd8a998e3cc";
  String mainUrl = "https://api.openweathermap.org/data/2.5/weather?";
  String unitType = "metric";
  Weather _weather = Weather();

  @override
  void initState() {
    getLocation();
    super.initState();
  }
  
  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    latValue = position.latitude;
    longValue = position.longitude;

    String requestUrl =
        "${mainUrl}lat=$latValue&lon=$longValue&appid=$appId&units=$unitType";

    print(requestUrl);

    var weatherUrl = Uri.parse(requestUrl);
    var response = await http.get(weatherUrl);
    print(response.body);

    dynamic result = json.decode(response.body);

    _weather.temp = result["main"]["temp"];
    _weather.pressure = result["main"]["pressure"];
    _weather.humidity = result["main"]["humidity"];
    _weather.name = result["name"];
    _weather.description = result["weather"][0]["description"];
    _weather.windSpeed=result["wind"]["speed"];

    Navigator.push(context, MaterialPageRoute(builder:(context)=> WeatherApp(weather: _weather,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading....',
              style: TextStyle(color: Colors.black, fontSize: 32.0),
            ),
            CircularProgressIndicator(color: Colors.blue,value: 15.0,)
          ],
        ),
      )
    );
  }
}
