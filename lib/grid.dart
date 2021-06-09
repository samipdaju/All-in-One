import 'package:currency/covid/brain.dart';
import 'package:currency/covid/corona.dart';
import 'package:flutter/material.dart';

class GridPaage extends StatefulWidget {
  const GridPaage({Key key}) : super(key: key);

  @override
  _GridPaageState createState() => _GridPaageState();
}

class _GridPaageState extends State<GridPaage> {
  Brain brain = Brain();
  Corona corona = Corona();
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final result = ModalRoute.of(context).settings.arguments as Map;
    final corona = result["coronaData"];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children:[
            Expanded(
              child: Row(
                children: [
                  Expanded(

                    child: GestureDetector(
                        onTap:(){

                          Navigator.pushNamed(context, "mars");

                    },child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.cover,
                          image: AssetImage("assets/nasa1.jpg")
                        )
                      ),
                    ),),
                  ),
                  Expanded(

                    child: GestureDetector(
                      onTap:(){

                        Navigator.pushNamed(context, "/");

                      },child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage("assets/nrb.jfif")
                          )
                      ),
                    ),),
                  ),


                ],
              ),
            ),
              Expanded(

                child: Row(
                  children: [
                    Expanded(

                      child: GestureDetector(
                        onTap:(){

                          Navigator.pushNamed(context, "rashiHome");

                        },child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage("assets/horoscope.jpg")
                          ),
                        ),
                      ),),
                    ),

                    Expanded(


                      child: GestureDetector(
                        onTap:(){

                          Navigator.pushNamed(context, "splash");

                        },child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover,
                                image: AssetImage("assets/weather.jpg")
                            )
                        ),
                      ),),
                    ),


                  ],
                ),
              ),
              Expanded(

                child: Row(
                  children: [
                    Expanded(

                      child: GestureDetector(
                        onTap:() {


                          Navigator.pushNamed(context, "covidCountry");


                        },child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text("Cases now : ${corona.today}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:Colors.yellowAccent,
                                  fontSize: 30

                                ),),
                                Icon(Icons.keyboard_arrow_up,
                                color: Colors.red,
                                size: 40,)
                              ],
                            ),

                            Text("Active Cases: ${corona.active}",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold,

                            ),),
                          ],
                        ),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover,
                                image: AssetImage("assets/corona.jpeg")
                            )
                        ),
                      ),),
                    ),



                  ],
                ),
              ),

              ]
          ),
        ),
      ),







    );
  }
}
// Navigator.pushNamed(context, "mars");
// Navigator.pushNamed(context, "/");
// Navigator.pushNamed(context, "splash");
// Navigator.pushNamed(context, "loading");
// Navigator.pushNamed(context, "rashiHome");