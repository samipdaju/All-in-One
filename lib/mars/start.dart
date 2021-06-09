import 'package:flutter/material.dart';
import 'dimag.dart';
import 'dart:math';
class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Dimag dimag = Dimag();

  void getUpdate()async{

    var result = await dimag.getNasa(Random().nextInt(810));

    Navigator.pushReplacementNamed(context, "display",arguments: {"nasaData": result}) ;

  }




  @override
  void initState() {
    getUpdate();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          value: 40,
        ),
      ),
    );
  }
}
