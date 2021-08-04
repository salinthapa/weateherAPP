import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';

class WeatherApp extends StatelessWidget {
  final Weather weather;
  WeatherApp({required this.weather});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xFFF4B893),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${weather.description}',
                  style: TextStyle(color: Colors.black, fontSize: 32.0),
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.map)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.star_border_outlined))
                  ],
                )
              ],
            ),
            Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage('assets/download.jpg'),
                )),
            Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.location_on)),
                        Text(
                          '${weather.name}',
                          style: TextStyle(color: Colors.black, fontSize: 32.0),
                        )
                      ],
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              '${weather.temp} °C',
                              style: TextStyle(color: Colors.black, fontSize: 38.0),
                            ),
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Wind"),
                                      Text("${weather.windSpeed} m/s",style: TextStyle(fontSize: 22.0),)

                                    ],
                                  ),
                                )),
                            Expanded(
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Humid"),
                                      Text("${weather.humidity} %",style: TextStyle(fontSize: 22.0),)
                                    ],
                                  ),
                                ))
                          ],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );;
  }
}

