import 'dart:convert';

import 'brain.dart';
import 'corona.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Brain brain = Brain();
  Corona _corona ;
  bool load = false;





  List <DropdownMenuItem<String>>getDropDownItems(){

    List<DropdownMenuItem<String>>  dropDownItems =[];

    List<String> countries = ["Nepal","India","Pakistan","UK","USA","Afghanistan", "Albania", "Algeria","Argentina",
      "Belgium","Brazil","Colombia","Bhutan",
          "Bolivia","Cambodia","Chile","China","Croatia","Denmark","Egypt","Estonia","Finland","France","Greece","Guyana", "Germany","Hungary","Italy","Iceland","Japan","Liberia",
     "Romania",
];

    for(int i =0; i<countries.length;i++){
      dropDownItems.add(DropdownMenuItem(
        child: Text(countries[i]),
      value:countries[i] ,));
    }

return dropDownItems;
  }
 void update()async{
   setState(() {
     load = true;
   });
   _corona = await brain.getApi("nepal");
   setState(() {
     load = false;
   });
 }
  @override
  void initState() {
    update();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: Color(0XFff000201),
      // backgroundColor: Color(0XFFF9B089),

      body: load? Center(
        child: CircularProgressIndicator(
          color: Colors.tealAccent,
          value: 40,
        ),
      ):SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: NetworkImage(
                          ("https://www.cnjg.org/sites/default/files/coronavirus_0.png"),
                        ),
                        height: 70.0,
                      ),
                      Text(
                        "Covid Monitor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff262932),
                    borderRadius: BorderRadius.circular(30.0)),
                margin: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "${_corona.country}",
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff262932),
                        borderRadius: BorderRadius.circular(30.0)),
                    margin: EdgeInsets.fromLTRB(20.0, 30, 20, 30),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Scroll for more Info  ",
                                style: TextStyle(fontSize: 18.0,
                                  color: Colors.white,),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 30.0,
                                color: Colors.red,
                              )
                            ],
                          ),
                          SizedBox(height: 10.0),
                          _corona.today == ""
                              ? Text(
                                  "Cases Today : TO BE UPDATED",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                )
                              : Text(
                                  "Cases Today: ${_corona.today}",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color(0xfffEF9B0F)),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.death == ""
                              ? Text(
                                  "New Deaths : TO BE UPDATED ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                )
                              : Text(
                                  "New Deaths : ${_corona.death}",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.red[800]),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.cases == null
                              ? Text(
                                  "Total Case: TO BE UPDATED",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                )
                              : Text(
                                  "Total case : ${_corona.cases}",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.yellow),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.active == null
                              ? Text(
                                  "Total Active Case :TO BE UPDATED",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                )
                              : Text(
                                  "Active Cases : ${_corona.active}",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.yellowAccent),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.deathTotal == null
                              ? Text(
                                  "Total Deaths :TO BE UPDATED",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                )
                              : Text(
                                  "Total Deaths : ${_corona.deathTotal}",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.red),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.recovered == ""
                              ? Text(
                                  "Recovered : TO BE UPDATED ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                )
                              : Text(
                                  "Newly Recovered : ${_corona.recovered}",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.lightGreen),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.recoverTotal == ""
                              ? Text(
                                  "Recovered Total : TO BE UPDATED ",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.green),
                                )
                              : Text(
                                  "Total Recovery : ${_corona.recoverTotal}",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.green),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.recoverTotal == ""
                              ? Text(
                                  "Deaths Per Million : TO BE UPDATED ",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.redAccent),
                                )
                              : Text(
                                  "Deaths Per Million : ${_corona.perM}",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.redAccent),
                                ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _corona.recoverTotal == ""
                              ? Text(
                                  "Total Tests : TO BE UPDATED ",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white),
                                )
                              : Text(
                                  "Total Test : ${_corona.test}",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white),
                                ),
                          SizedBox(height: 20.0),
                          Text(
                            "Last Updated :  ${_corona.time}",
                            style: TextStyle(
                                color: Color(0xffF700C0), fontSize: 25.0),
                          ),
                        ],
                      ),
                    )),
              ),
              Row(
                children: [
                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "myths");
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                            color: Color(0xfff262932),
                            borderRadius: BorderRadius.circular(30.0)),


                        child:
                        Text("🔱 Covid Myths ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "hospitals");
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),

                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                            color: Color(0xfff262932),
                            borderRadius: BorderRadius.circular(30.0)),
                        child:
                        Text("🏥 Hospitals",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffF700C0),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                margin: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 20),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    DropdownButton<String>(

                       icon: Icon(Icons.arrow_drop_down_circle_sharp,
                         color: Colors.black,
                       ),
                      iconSize: 30,
                      underline: Container(
                        height: 0,

                      ),
                      elevation:16,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30
                      ),

                    value: _corona.country,
                      onChanged: (value) async{
                         setState(() {
                           load = true;

                         });

                           String  countryName = value;
                           _corona = await brain.getApi(countryName);
                         setState(() {
                           load = false;
                         });



                      },
                      items: getDropDownItems(),


                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
