import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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