import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:returndex/model/Auth.dart';
import 'package:returndex/model/taglist.dart';


class RestApiData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: "Amzad Api Data demo",

          home: Scaffold(
        appBar: new AppBar(
          title: Text('Rest Api Data'),
        ),
        body: Container(
          child: FutureBuilder(
            future: getApiData(),
            builder: (context,snapshot){


              if (snapshot.data ==null) {
                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );
              }
              else{
                 return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context , int index){
                  return ListTile(
                    leading: Icon(Icons.blur_on,color:Colors.blue),
                    title: Text(snapshot.data[index].cityName),
                    subtitle: Text(snapshot.data[index].countryCode + ' ' + snapshot.data[index].countryName),

                  );
                },

              );
              }
             
            },
          ),
        )
      ),
    );
  }


}

class Cities {
  final String cityName;
  final String countryName;
  final String countryCode;

  Cities(this.cityName,this.countryCode,this.countryName);

  
}





Future<List<Cities>> getApiData() async {
    String url = 'http://rdapi.cashaa.news/user/GetCityList';
    final response =
        await http.get(url);

var jsonData = json.decode(response.body);

List<Cities> citys = [];

for( var u in jsonData){
Cities city = Cities(u["CityName"], u["CountryCode"], u["CountryName"]);
citys.add(city);
}

print(citys.length);

return citys;
  }


Future<User> getQuote() async {
    String url = 'http://rdapi.cashaa.news/user/GetCountryList';
    final response =
        await http.get(url, headers: {"Accept": "application/json"});


    if (response.statusCode == 200) {
      print("Success");
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<User> getloginpassword() async {
    String url = 'http://rdapi.cashaa.news/api/Auth';
    final response =
        await http.post(url, headers: {"Accept": "application/json"},body: {
          'loginType': "2",
          'Mobile': "9919960019",
         'CountryId': "d70504d3-c323-e911-80e5-008cfa5ac2c5",
         'Password': "Amjad@123%"
        });


    if (response.statusCode == 200) {
      print("Success");
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }






  
  Future<dynamic> getApiDataLogin() async {
    String url = 'http://rdapi.cashaa.news/api/Auth';
    final response =
        await http.post(url,
        body: {
          'loginType': "2",
          'Mobile': "9919960019",
         'CountryId': "d70504d3-c323-e911-80e5-008cfa5ac2c5",
         'Password': "Amjad@123%"
        }
        );

print(response.body);
var jsonData = json.decode(response.body);
print ("faraaz");
print(jsonData);

print(jsonData);

return jsonData;
  }
