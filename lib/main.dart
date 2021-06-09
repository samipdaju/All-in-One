import 'package:currency/covid/home.dart';
import 'package:currency/covid/myths.dart';
import 'package:currency/horoscope/rashiHome.dart';
import 'package:currency/horoscope/rashiLoad.dart';
import 'package:currency/hospitals.dart';
import 'package:currency/mars/display.dart';
import 'package:currency/mars/start.dart';
import 'package:currency/weather/city.dart';
import 'package:currency/weather/splash_screen.dart';
import 'package:currency/weather/ui.dart';
import 'package:flutter/material.dart';
import 'covid/country.dart';
import 'covid/loading.dart';
import 'horoscope/showHoroscope.dart';
import 'waiting.dart';
import 'exhangeshow.dart';
import 'grid.dart';
import 'sell.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initfireBase();
  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: "loading",
      routes: {



        "/": (context)=> ExchangePage(),
        "grid": (context)=> GridPaage(),
        "mars": (context)=> StartPage(),
        "display": (context)=> Display(),
        "splash":(context)=> SplashPage(),
        "ui":(context) => UI(),
        "city" :(context)=> CityPage(),
        "covidCountry" :(context)=> HomePage(),
        "nextCountry" :(context)=> CountryPage(),
        "loading":(context)=> Loading(),
        "rashiLoad" : (context)=> RashiLoad(),
        "showHoroscope":(context)=> ShowHoroscope(),
        "rashiHome":(context)=> RashiHome(),
        "myths":(context)=> MythPage(),
        "hospitals":(context)=> Hospital(),


      },
    );
  }
}

void initfireBase ()async {
  final _messaging = FirebaseMessaging.instance;

  _messaging.requestPermission();

  _messaging.getToken().then((String id) async {
    print(id);
  });
}
