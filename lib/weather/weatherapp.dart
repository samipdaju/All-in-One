import 'dart:convert';

import 'weather.dart';


import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart' ;
import 'package:flutter/material.dart';


class WeatherApp{

  static final WeatherApp _weatherApp = WeatherApp.internal();
  WeatherApp.internal();

  Weather weather;

  factory WeatherApp(){
    return _weatherApp;
  }






  Future <Position> getLocation() async{

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);


    return position;

  }

  Future<Weather> getAPi(double userLatitude , double userLongitude) async{

    String requestUrl ="https://api.openweathermap.org/data/2.5/weather?lat=$userLatitude&lon=$userLongitude&appid=fcffd80bcf50e91b3a57745a36d8b24f";
    weather = await getResponse(requestUrl);
    return weather;



  }

  Future<Weather> getApiCity(name)async{

    String linkCity = "https://api.openweathermap.org/data/2.5/weather?q=$name&appid=757c5aee09b8e25b59ad9b6292c0c912";
    weather = await getResponse(linkCity);
    return weather;


  }

  Future<Weather> getResponse(link)async{

    var url = Uri.parse(link);
    Response response;
    response = await get(url);
    print(response.body);

    var result = jsonDecode(response.body);
    print(result);
    Weather weather = Weather(
        pic: result["weather"][0]["main"],
        min: result["main"]["temp_min"],
        max: result["main"]["temp_max"],
        temp: result["main"]["temp"],
        wind: result["wind"]["speed"],
        humid: result["main"]["humidity"],
        condition : result["weather"][0]["description"],
        location: result["name"],
        image: result["weather"][0]["icon"]

    );

    print (weather.temp);
    print(weather.humid);
    print(weather.location);
    print(weather.wind);
    print(result);


    return weather;



  }





}