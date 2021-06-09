import 'package:flutter/material.dart';

import 'covid/brain.dart';
import 'covid/corona.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospital extends StatefulWidget {
  const Hospital({Key key}) : super(key: key);

  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {

  Brain brain = Brain();
  Future <void> customLaunch(command) async {
    if (await canLaunch(command)) {
      print("launched $command");
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  List<HospitalList> hospitals =[];
  bool isLoading = false;

   void getHospUpdate()async{
     setState(() {
       isLoading = true;
     });


  hospitals = await brain.getHospital();


     setState(() {
       isLoading = false;
     });
     print(hospitals.length);
  }
  void initState() {
     getHospUpdate();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLoading? Center(
        child: CircularProgressIndicator(

          value: 40,

        ),
      ):

         SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://i.pinimg.com/originals/e6/aa/e0/e6aae0c45231a39bc5b17293ced66d63.jpg"),
                fit: BoxFit.cover
              )
            ),
            child: ListView.builder(itemBuilder:  (context,position){


                return Column(
                  children: [

                    Container(
                      padding: EdgeInsets.all(15
                      ),
                      margin: EdgeInsets.all(15),

                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Color(0xff14181E)
                     )
                      ,

                      child: Column(



                        children: [
                          Text("Hospital name: \n ${hospitals[position].name}",
                          style: TextStyle(
                            fontSize: 25,
                              color: Colors.white
                          ),),
                          SizedBox( height: 15,),
                          hospitals[position].dr == "" ?Text("Doctor's name:\n Not available ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white
                            ),) :  Text("Doctor's name:\n  ${hospitals[position].dr}",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 25,

                            ),),
                          hospitals[position].dr == "" ?ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.green,
                              size: 30,
                            ),
                            title:  Text("Not available",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white
                              ),),
                          ) :GestureDetector(
                            onTap: (){
                              print("YES");
                              customLaunch("tel: +977 ${hospitals[position].contact}");
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.green,
                                size: 30,
                              ),
                               title:  Text(" ${hospitals[position].contact}",
                                style: TextStyle(

                                    fontSize: 25,
                                  color: Colors.green,
                                  decoration: TextDecoration.underline
                                ),),
                            ),
                          )

                        ],
                      ),
                    ),

                  ],
                );
                  },
                 itemCount: hospitals.length

                  ),
            ),
          )

    );
  }
}
