import 'dart:ui';

import 'package:currency/Exchange.dart';
import 'package:currency/logic.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key key}) : super(key: key);

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  List<Exchange> exchanges = [];
  Logic logic = Logic();



  var sellColor = Color(0xfffA9ADB2);

  var buyColor = Colors.white;

  var onTapColor = Color(0xfffA9ADB2);
  bool isLoad = false;
  Exchange _exchange ;
  var change;

  getUpdate() async {
    setState(() {
      isLoad = true;
    });

    exchanges = await logic.getAPi();
    setState(() {
      isLoad = false;
    });
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
        backgroundColor: Color(0xfff1A1D1F),
        appBar: AppBar(
          title: Text(
            "Exchange Rates",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color(0xfff1A1D1F),
        ),
        body: isLoad
            ? Center(
                child: CircularProgressIndicator(
                  value: 50,
                ),
              )
            : SafeArea(
                child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (buyColor == onTapColor) {

                              buyColor = Colors.white;
                              sellColor = onTapColor;

                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 30, left: 30),
                          decoration: BoxDecoration(
                              color: buyColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Buy",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (sellColor == onTapColor) {
                              sellColor = Colors.white;
                              buyColor = onTapColor;
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 30, left: 30),
                          decoration: BoxDecoration(
                              color: sellColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Sell",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),

                      Expanded(
                        flex:3,
                        child: Text(
                          "Currencies",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),

                      Expanded(
                        flex:2,
                        child: Text(
                          "Unit",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),

                      Expanded(
                        flex:2,
                        child: Text(
                          buyColor== Colors.white?"Buying Rate": "Selling Rate",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        itemCount: exchanges.length,
                        itemBuilder: (context, position) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 25.0,
                                        backgroundImage: AssetImage(
                                            "assets/${exchanges[position].image}.png"),
                                      ),
                                      title: Text(
                                        " ${exchanges[position].name}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${exchanges[position].unit}",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    flex:2,
                                    child: Text(
                                      buyColor== Colors.white?"${exchanges[position].buy}":"${exchanges[position].sell}",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          );
                        }),
                  ),


                )
              ])));
  }
}
