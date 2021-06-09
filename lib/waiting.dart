import 'package:currency/Exchange.dart';
import 'package:currency/logic.dart';
import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({Key key}) : super(key: key);

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  List<Exchange> exchanges =[];
  Logic logic = Logic();

  getUpdate() async{

    exchanges =  await logic.getAPi();



    Navigator.pushReplacementNamed(context, "/1",arguments: {"exchangeData": exchanges});


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
            backgroundColor: Colors.red,

          ),
        ),
      ),
    );
  }
}
