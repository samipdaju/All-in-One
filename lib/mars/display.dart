import 'package:flutter/material.dart';
import 'Nasa.dart';
import 'dimag.dart';
import 'package:http/http.dart'as http;
import 'dart:math';

class Display extends StatefulWidget {
  const Display({Key key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  Dimag dimag = Dimag();
  Nasa nasa = Nasa();


  @override
  Widget build(BuildContext context) {


    final   result = ModalRoute.of(context).settings.arguments as Map;
    final nasa = result["nasaData"];




    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Column(


                children: [

                  Text("MARS PHOTOS",style: TextStyle(fontSize: 40,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),

                  ),

                  Container(
                    height: 400,
                    child: Image(image: NetworkImage("${nasa.image1}"),

                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image(image: NetworkImage("${nasa.image2}",
                    ),


                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image(image: NetworkImage("${nasa.image3}",
                    ),


                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image(image: NetworkImage("${nasa.image4}",
                    ),


                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image(image: NetworkImage("${nasa.image5}",
                    ),


                    ),
                  ),
                  Container(

                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("${nasa.image6}"),
                        )
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(

                          image: NetworkImage("${nasa.image7}",),
                        )
                    ),
                  ),

                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("${nasa.image8}"),
                        )
                    ),
                  ),


                  GestureDetector(
                    onTap: (){
                     setState(() async {

                       Navigator.pushReplacementNamed(context, "mars");
                     });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Change Photos",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.purpleAccent
                          ),),
                          Icon(Icons.refresh,
                              size: 40,
                              color: Colors.purpleAccent)
                        ],
                      ),
                    ),
                  )



                ]
      ),
            ),
          ),
        ),
      )
    );
  }
}
