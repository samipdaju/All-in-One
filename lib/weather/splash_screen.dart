import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'weather.dart';
import 'weatherapp.dart';
import 'dart:math';


class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  List<String> facts =[

    "The coldest temperature ever officially recorded was -89.2°C. Brrrr!",
    "You can tell the temperature by counting a cricket’s chirps",
    "Sandstorms can swallow up entire cities",
    " About 2,000 thunderstorms rain down on Earth every minute.",


 "Lightning often follows a volcanic eruption.",

 "Raindrops can be the size of a housefly and fall at more than 30kmph.",

  " Cape Farewell in Greenland is the windiest place on the planet.",

  " Hurricanes can push more than 6m of water ashore.",

  " In July 2001 the rainfall in Kerala, India, was blood red!",



  " Blizzards can make snowflakes feel like pellets hitting your face.",

  " A hurricane in Florida, USA, caused 900 captive pythons to escape.",

" Some frogs get noisier just before it rains."




  ];

  WeatherApp _weatherApp = WeatherApp();
  Weather weather = Weather();

  void getWeather()async{

    Position position = await _weatherApp.getLocation();

    // var result = await _weatherApp.getAPi(27.716375803935396, 85.40475992600031);
   weather = await _weatherApp.getAPi(position.latitude, position.longitude);

    Duration twoSec = Duration(seconds: 2);
    sleep(twoSec);


    Navigator.pushReplacementNamed(context, 'ui',);




  }

  @override
  void initState() {
    // TODO: implement initState
    getWeather();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Did you know?",style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),),
                SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator(
                  value: 30.0,
                  backgroundColor: Colors.blue,

                ),
                SizedBox(
                  height: 40,
                ),
                Text("${facts[Random().nextInt(facts.length)]}",style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),),
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}
