import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'weatherapp.dart';
import 'models/weather.dart';

class UI extends StatefulWidget {
  const UI({Key key}) : super(key: key);

  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  Weather weather = Weather();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WeatherApp _weatherApp = WeatherApp();
    final weather = _weatherApp.weather;

    return Scaffold(
      backgroundColor: Color(0xfff02445E),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xfff02445E),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${(weather.temp - 273).toStringAsFixed(1)}°",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Expanded(

                                      child: Image(
                                        image: AssetImage("assets/min T.png"),
                                        height: 60,),
                                    ),
                                    Expanded(
                                      flex:2,

                                      child: Text("Min temp: ${(weather.min -273).toStringAsFixed(1)}°",style:
                                      TextStyle(fontSize: 20.0,
                                          color:Colors.white),

                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(

                                      child: Image(image: AssetImage("assets/maxT.png"),
                                        height: 60,),
                                    ),
                                    Expanded(
                                      flex:2,
                                      child: Text("Max temp: ${(weather.max -273).toStringAsFixed(1)}°",style:
                                      TextStyle(fontSize: 20.0,
                                          color:Colors.white),
                                      ),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        flex: 2,
                        child: Image.asset("assets/${weather.image}.png")),
                    SizedBox(height:20),

                    Expanded(
                      child: Text(
                        "${(weather.condition).toUpperCase()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(0)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Column(
                  children: [
                    Expanded(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, "city");
                            },
                            child: Icon(
                              Icons.location_on,
                              color: Color(0xfff0C5672),
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: Text(
                              "${weather.location}   ",
                              style: TextStyle(
                                color: Color(0xfff0C5672),
                                fontSize: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(

                                child: Text(
                                  "Wind",
                                  style: TextStyle(
                                    color: Color(0xfff0C5672),
                                    fontSize: 30.0,
                                  ),
                                ),
                              ),

                              Expanded(

                                child: Text(
                                  "${weather.wind} km/h",
                                  style: TextStyle(
                                    color: Color(0xfff0C5672),
                                    fontSize: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30.0,

                          ),
                          Expanded(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(

                                  child: Text(
                                    "Humidity",
                                    style: TextStyle(
                                      color: Color(0xfff0C5672),
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ),

                                Expanded(

                                  child: Text(
                                    "${weather.humid}%",
                                    style: TextStyle(
                                      color: Color(0xfff0C5672),
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
