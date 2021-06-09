import 'package:flutter/material.dart';
import 'package:currency/mars/dimag.dart';

class RashiLoad extends StatefulWidget {

  const RashiLoad({Key key}) : super(key: key);

  @override
  _RashiLoadState createState() => _RashiLoadState();
}

class _RashiLoadState extends State<RashiLoad> {


  Dimag dimag = Dimag();

  getUpdate()async{

    var result = await dimag.getHoroscopeApi("sagittarius");
    Navigator.pushReplacementNamed(context, "showHoroscope",arguments: {"horoscopeData": result}) ;

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
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            value: 40,
          ),
        ),
      ),
    );
  }
}
