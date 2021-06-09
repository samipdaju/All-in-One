import 'dart:convert';

import 'package:currency/horoscope/Horoscope.dart';
import 'package:http/http.dart';
import 'Nasa.dart';
class Dimag{
  int i;
  String sign;

  Future<Nasa> getNasa(i)async{

    var url = Uri.parse('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=757Q8o9g5rY79zzhkZf7jFMBbRyOX69Rm61XaGe6&sol=1000');

    Response response;
    response =   await get(url);



  var result = jsonDecode(response.body);


  Nasa nasa = Nasa(


    image1: result["photos"][843]["img_src"],
    image2: result["photos"][i]["img_src"],
    image3: result["photos"][i+1]["img_src"],
    image4: result["photos"][i+5]["img_src"],
    image5: result["photos"][i+10]["img_src"],
    image6: result["photos"][i+20]["img_src"],
    image7: result["photos"][i+30]["img_src"],
    image8: result["photos"][i+40]["img_src"],



  );
    print(response.statusCode);
print(nasa.image1);
print(nasa.image2);
    print(response.body);


  return nasa;



  }


  Future<Horoscope> getHoroscopeApi(sign)async{
    var url = Uri.parse("https://aztro.sameerkumar.website/?sign=$sign&day=today");
    Response response = await post(url);
    print(response.body);

    var result = jsonDecode(response.body);

    Horoscope horoscope = Horoscope(
        description: result["description"],
      num:  result["lucky_number"],
      color: result["color"],
      mood: result["mood"],
        comp:result["compatibility"]
    );
print(horoscope.description);
    return horoscope;

  }
  }



