import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'weather.dart';
import 'weatherapp.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  WeatherApp weatherApp =WeatherApp();
  Weather weather = Weather();
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage("assets/hor.jpg"),
          fit: BoxFit.cover

        )),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: TextFormField(
                      onChanged: (value){

                        cityName = value ;


                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(

                        ),
                        labelText: "Enter a city",
                        labelStyle: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                        suffixIcon:
                         IconButton(
                           onPressed: () async{


                             var result = await weatherApp.getApiCity(cityName);

                             if (result != null){
                               Navigator.pushReplacementNamed(context, "ui",arguments: {"weatherData": result});


                             }


                           },
                           icon: Icon(Icons.send,
                            color: Colors.blue,
                            size: 30.0,),
                         ),



                      ),

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
