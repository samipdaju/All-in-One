import 'package:currency/covid/brain.dart';
import 'package:currency/covid/corona.dart';
import 'package:flutter/material.dart';

class MythPage extends StatefulWidget {
  const MythPage({Key key}) : super(key: key);

  @override
  _MythPageState createState() => _MythPageState();
}

class _MythPageState extends State<MythPage> {
  CovidMyths cov= CovidMyths();
  Brain brain = Brain();

  List<CovidMyths> covidMyths =[];
bool isLoading = false;

  void updateMyth()async{
    setState(() {
      isLoading = true;
    });

     covidMyths = await brain.getMyth();
    setState(() {
      isLoading = false;
    });
    print(covidMyths.length);

  }
  @override
  void initState() {
    updateMyth();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Covid Myths"),
        centerTitle: true,
      ),
      body: isLoading? Center(
        child: CircularProgressIndicator(
          
          value: 40,

        ),
      ): SafeArea(
        child: ListView.builder(itemCount:covidMyths.length,
            itemBuilder: (context,position){
          return Column(
            children: [
              Container(

                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  color: Colors.black

                ),

                child: Column(
                  children: [
                    Container(

                      padding: EdgeInsets.all(15),
                      child: Text("Myths: ${covidMyths[position].myths_eng}",
                      style:  TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xfff15191D),
                      ),
                      padding: EdgeInsets.all(15),

                      child: Column(
                        children: [
                          Text("Reality: ${covidMyths[position].reality_english}",
                            style:  TextStyle(
                              color: Colors.white,
                                fontSize: 20
                            ),),
                          covidMyths[position].image==null ? Text(""):
                        Image(image: NetworkImage("${covidMyths[position].image}"),
                          height: 400,
                          width: MediaQuery.of(context).size.width-40)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
            }),
      ),
    );

  }
}
