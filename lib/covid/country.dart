


import 'package:flutter/material.dart';
import 'brain.dart';
import 'corona.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  bool loading = false;

  String countryName;


  Brain brain = Brain();
  @override
  Widget build(BuildContext context) {
    // final   result = ModalRoute.of(context).settings.arguments as Map;
    // final _corona = result["coronaData"];

    return Scaffold(
      backgroundColor:  Color(0XFA08AF4),
      appBar: AppBar(

        title: Text("Choose a Country"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20.0,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading == true? CircularProgressIndicator(
                value: 40,
              ):TextField(



                onChanged: (value){

                  countryName = value;


              },

                decoration: InputDecoration(



                  suffixIcon: IconButton(icon: Icon(Icons.send),
                    onPressed: () async{



                      var result = await brain.getApi(countryName);
                      print(result);
                      setState(() {
                        if (result != null){

                          loading = true;

                        }


                      });

                      if (result != null){
                      Navigator.pushReplacementNamed(context, "covidCountry",arguments: {"coronaData": result});


                      }

                    },
                    color: Colors.blue,),

                  helperText: "Example: India",
                  border: OutlineInputBorder(),
                  helperStyle: TextStyle(color: Colors.white,
                  fontSize: 20.0),
                  labelText: "Enter a country name",
                  fillColor: Color(0xfff72339F),
                  filled: true,
                  contentPadding: EdgeInsets.all(20),

                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,

                  ),
                ),
              ),
            ),
                SizedBox(height: 20.0,),

                Expanded(

                  child: Row(
                    children: [
                      SizedBox(width: 150.0,),
                      Expanded(

                        child: Image(image: NetworkImage(
                            ("https://images.vexels.com/media/users/3/193297/isolated/preview/4752adfc1ac1732ee4ebb62297016c15-covid-19-cartoon-icon-by-vexels.png"),
                        ),

                        ),

                      ),

                    ],
                  ),
                ),
                Expanded(

                  child: Row(
                    children: [

                      Expanded(child: Image.network(
                        "https://ichef.bbci.co.uk/childrens-responsive-ichef-live/r/320/1x/cbbc/stay_home_stay_safe_logo.png"
                                     )),
                      SizedBox(width: 120.0,),
                    ],
                  ),
                ),


          ],
        ),
      ),
    );
  }
}

