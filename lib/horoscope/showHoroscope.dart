import 'package:flutter/material.dart';
import 'package:currency/horoscope/Horoscope.dart';

import 'package:currency/mars/dimag.dart';
Horoscope horoscope = Horoscope();
Dimag dimag = Dimag();

class ShowHoroscope extends StatefulWidget {
  const ShowHoroscope({Key key}) : super(key: key);

  @override
  _ShowHoroscopeState createState() => _ShowHoroscopeState();
}

class _ShowHoroscopeState extends State<ShowHoroscope> {






  @override
  Widget build(BuildContext context) {

    final   result = ModalRoute.of(context).settings.arguments as Map;
    final horoscope = result["horoscopeData"];

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/back.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Horoscope",style: TextStyle(
                  fontSize: 40
              ),),
              Container(

                margin: EdgeInsets.all(10),
                child: Text("Description : ${horoscope.description}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                      fontSize: 30
                  ),),

              ),
              Results(
                leading: "Lucky Number:",
                title: horoscope.num,
              ),
              Results(
                leading: "Lucky Color:",
                title: horoscope.color,
              ),
              Results(
                leading: "Mood:",
                title: horoscope.mood,
              ),
              Results(
                leading: "Comptability:",
                title: horoscope.comp,
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Results extends StatelessWidget {

  Results({ this.leading,this.title});
  String leading;
  String title;




  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text( leading,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30
        ),
      ),
      title:  Text( title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30
        ),
      ),
    );
  }
}
