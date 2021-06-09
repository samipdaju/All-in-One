import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'loading.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'country.dart';

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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context)=> Loading(),
        "/1": (context)=> HomePage(),
        "/2": (context)=> CountryPage(),
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

