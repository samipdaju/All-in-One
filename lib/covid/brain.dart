import 'dart:convert';


import 'package:http/http.dart';
import 'corona.dart';
import 'country.dart';




class Brain {
  CovidMyths cov = CovidMyths();
  HospitalList hosp = HospitalList();


  var result;


  Future<Corona> getApi(name) async {

      final url = Uri.parse(
          "https://worldometers.p.rapidapi.com/api/coronavirus/country/$name");
      Response response;

      response = await get(url, headers: {
        "x-rapidapi-key": "c7419ac5eamsh53873b8eb09d0cbp176e35jsnc38c2507980c",
      });


      print(response.body);

      result = jsonDecode(response.body);

      Corona _corona = Corona(
          recoverTotal: result["data"]["Total Recovered"],
          country: result["data"]["Country"],
          time: result["last_update"],
          cases: result["data"]["Total Cases"],
          today: result["data"]["New Cases"],
          death: result["data"]["New Deaths"],
          recovered: result["data"]["New Recovered"],
          active: result["data"]["Active Cases"],
          deathTotal: result["data"]["Total Deaths"],
        test: result["data"]["Total Tests"],
        perM: result["data"]["Deaths/1M pop"]

      );


      return _corona;


  }

  Future<List<CovidMyths>> getMyth()async{





    var url = Uri.parse("https://corona.askbhunte.com/api/v1/myths");
    Response response;
 response = await get(url);

 print(response.body);

 var result = jsonDecode(response.body);
 var covidMythsData = result["data"];

    List<CovidMyths> covidMyths =[];

    for(int i =0; i< covidMythsData.length; i++ ) {
      covidMyths.add( CovidMyths(
        myths_eng: result["data"][i]["myth"],
        myths_np: covidMythsData[i]["myth_np"],
        reality_english: covidMythsData[i]["reality"],
        reality_np: covidMythsData[i]["reality_np"],
        image:  covidMythsData[i]["image_url"]
      )

    );

    }
    print(cov.myths_eng);
    print(cov.image);

    return covidMyths;
  }

  Future<List<HospitalList>> getHospital() async {
     Response response;
     var url = Uri.parse("https://corona.askbhunte.com/api/v1/hospitals");
     response = await get(url);

     var result = jsonDecode(response.body);
     print(result);
     var hospitalData = result["data"];
     List<HospitalList> hospitals = [];

     for (int j=0; j<hospitalData.length; j++){

       hospitals.add(
         HospitalList(name: hospitalData[j]["name"],
         contact: hospitalData[j]["contact_person_number"],
             dr:hospitalData[j]["contact_person"]
           )
       );

     }

     print(hospitalData[0]["name"]);
     print(hosp.dr);

     return hospitals;




  }


}




