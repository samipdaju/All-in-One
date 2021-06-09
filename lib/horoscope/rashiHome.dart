import 'package:currency/horoscope/rashiLoad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency/mars/dimag.dart';

Dimag dimag = Dimag();


class RashiHome extends StatefulWidget {
  const RashiHome({Key key}) : super(key: key);

  @override
  _RashiHomeState createState() => _RashiHomeState();
}

class _RashiHomeState extends State<RashiHome> {

  bool load = false;

  RashiLoad rashiLoad = RashiLoad();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: load  ? Center(
        child: CircularProgressIndicator(
          value: 50,
        ),
      ):SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


              children: [
                Text("CHOOSE YOUR HOROSCOPE",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),),
                SizedBox(height: 20,),
                Column(
                  children:[
                ListOfHoroscopes(
                  leading: "sag.jpg",
                  title: "Sagittarius",

                  onPress: () async{
                    setState(() {
                      load = true;

                    });

                    dimag.sign = "sagittarius";

                    var result = await dimag.getHoroscopeApi("sagittarius");
                    setState(() {
                      load = false;

                    });

                    Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});


                  },
                ),
                SizedBox(height: 20,),

                ListOfHoroscopes(
                  leading: "leo.jpg",
                  title: "Leo",

                  onPress: () async{
                    setState(() {
                      load = true;

                    });

                    dimag.sign = "leo";

                    var result = await dimag.getHoroscopeApi(dimag.sign);
                    setState(() {
                      load = false;

                    });

                    Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});


                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "scorpio.jpg",
                  title: "Scorpio",

                  onPress: () async{
                    setState(() {
                      load = true;

                    });

                    dimag.sign = "scorpio";

                    var result = await dimag.getHoroscopeApi(dimag.sign);
                    setState(() {
                      load = false;

                    });

                    Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});


                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "ariesss.png",
                  title: "Aries",
                  onPress: () async{
                    setState(() {
                      load = true;

                    });

                    dimag.sign = "aries";

                    var result = await dimag.getHoroscopeApi(dimag.sign);
                    setState(() {
                      load = false;

                    });

                    Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});


                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "taurus.png",
                  title: "Taurus",

                  onPress: () async{
                    setState(() {
                      load = true;

                    });

                    dimag.sign = "taurus";

                    var result = await dimag.getHoroscopeApi(dimag.sign);
                    setState(() {
                      load = false;

                    });

                    Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});


                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "capricon.jpg",
                  title: "Capricorn",

                  onPress: () async{
                    setState(() {
                      load = true;

                    });

                    dimag.sign = "capricorn";

                    var result = await dimag.getHoroscopeApi(dimag.sign);
                    setState(() {
                      load = false;

                    });

                    Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});


                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "cancer.png",
                  title: "Cancer",

                  onPress: (){
                    setState(() async{
                      dimag.sign = "cancer";
                      load = true;
                      var result = await dimag.getHoroscopeApi(dimag.sign);
                      load = false;
                      Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});
                    });
                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "pisces.jpg",
                  title: "Pisces",

                  onPress: (){
                    setState(() async{
                      dimag.sign = "pisces";
                      load = true;
                      var result = await dimag.getHoroscopeApi(dimag.sign);
                      load = false;
                      Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});
                    });
                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "virgo.jfif",
                  title: "Virgo",

                  onPress: (){
                    setState(() async{
                      dimag.sign = "virgo";
                      load = true;
                      var result = await dimag.getHoroscopeApi(dimag.sign);
                      load = false;
                      Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});
                    });
                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "gemini.jpg",
                  title: "Gemini",

                  onPress: (){
                    setState(() async{
                      dimag.sign = "gemini";
                      load = true;
                      var result = await dimag.getHoroscopeApi(dimag.sign);
                      load = false;
                      Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});
                    });
                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "aquarius.jpg",
                  title: "Aquarius",

                  onPress: (){
                    setState(() async{
                      dimag.sign = "aquarius";
                      load = true;
                      var result = await dimag.getHoroscopeApi(dimag.sign);
                      load = false;
                      Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});
                    });
                  },
                ),
                SizedBox(height: 20,),
                ListOfHoroscopes(
                  leading: "libra.jfif",
                  title: "Libra",

                  onPress: (){
                    setState(() async{
                      dimag.sign = "libra";
                      load = true;
                      var result = await dimag.getHoroscopeApi(dimag.sign);
                      load = false;
                      Navigator.pushNamed(context, "showHoroscope",arguments:{"horoscopeData": result});
                    });
                  },
                ),
                    ]
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListOfHoroscopes extends StatelessWidget {

  String title;
  String leading;
  Function onPress;
ListOfHoroscopes({this.title,this.leading,this.onPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
         decoration: BoxDecoration(
             color: Colors.purpleAccent,
           borderRadius: BorderRadius.circular(20)
         ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:AssetImage("assets/$leading"),
              radius: 30,
            ) ,
            title:  Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),),

          ),
        ),
      ),
    );
  }
}

