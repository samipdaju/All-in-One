import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home.dart';
import 'ui.dart';
import 'city.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: {
        "/1":(context) => UI(),
        "/2" :(context)=> CityPage(),
      },
    );
  }
}
