import 'dart:convert';

import 'Exchange.dart';

import 'package:http/http.dart';

class Logic{


  Exchange exchange = Exchange();



  Future<List<Exchange>> getAPi()async{

    var url = Uri.parse("https://www.nrb.org.np/api/forex/v1/rates?from=2021-05-28&to=2021-05-28&per_page=100&page=1");

    Response response;
    response = await get(url) ;

    print(response.statusCode);
    print(response.body);

    var result = jsonDecode(response.body);

    List<Exchange> exchanges = [];


      for (int i =0; i< result["data"]["payload"][0]["rates"].length; i++){

        exchanges.add(Exchange(

          name: result["data"]["payload"][0]["rates"][i]["currency"]["name"],
          unit: result["data"]["payload"][0]["rates"][i]["currency"]["unit"],
          buy: result["data"]["payload"][0]["rates"][i]["buy"],
          sell: result["data"]["payload"][0]["rates"][i]["sell"],
          image: result["data"]["payload"][0]["rates"][i]["currency"]["iso3"]


        ));

      }


    print(exchange.name);
    print(result);

    return exchanges;






  }



  }



