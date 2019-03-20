import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:returndex/model/Auth.dart';
 
 
 	final String host = developmentHost;
	final String productionHost = 'https://api.returndex.com';
	final String developmentHost = 'http://rdapi.cashaa.news/';

 Future<UserDetails> authenticateUser(String logintype,String mobileNumber,String password) async {
    var endpoint = "api/Auth";
    var url = host + endpoint;
    var body = json.encode({
          "loginType": logintype,
          "Mobile": mobileNumber,
          "CountryId": "d70504d3-c323-e911-80e5-008cfa5ac2c5",
          "Password": password
      });

    Map<String,String> headers = {
      'Content-type' : 'application/json', 
      'Accept': 'application/json',
    };
try {
  final response =
        await http.post(url, body: body, headers: headers);
    final responseJson = json.decode(response.body);
   UserDetails user = UserDetails(responseJson['AccessToken'], responseJson['Mobileno']);
  
    print(user.accessToken);
    return user;
  
} catch (exception) {
  	print(exception);
		return null;
}
    
}