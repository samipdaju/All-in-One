
import 'package:flutter/material.dart';
import 'home.dart';
import 'brain.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'country.dart';
import 'corona.dart';
HomePage homePage = HomePage();


class Loading extends StatefulWidget {

  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Brain brain = Brain();

  Corona _corona = Corona();









 void getUpdate() async{




   var result = await brain.getApi("Nepal");






   Navigator.pushReplacementNamed(context, "grid",arguments: {"coronaData": result});

 }
 @override
  void initState() {
    // TODO: implement initState
     getUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

     Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            value: 30.0,

            backgroundColor: Colors.blue,

          ),
        ) ,
      ),
    );
  }
}


