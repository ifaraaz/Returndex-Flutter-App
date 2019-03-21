import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:returndex/model/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
 
 	final String host = developmentHost;
  final String host_withoutHTTP = developmentHost_withoutHTTP;
	final String productionHost = 'https://api.returndex.com';
	final String developmentHost = 'http://rdapi.cashaa.news/';
  final String productionHost_withoutHTTP = "api.returndex.com";
   final String developmentHost_withoutHTTP = "rdapi.cashaa.news";


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
    final status =response.statusCode;
    if (status == 201) {
      
       UserDetails user = UserDetails(responseJson['AccessToken'], responseJson['Mobileno']);
   if (user.accessToken.isNotEmpty) {
     saveTokenPreferences(user.accessToken);
   
  
    return user;
    }
    else {
      return null;

    }
   
     

    }
   
  
} catch (exception) {
  //	print(exception);
    logoutUser();
		return null;
}
    
}


Future<OtpLogin> loginwithOTP(String mobileNumber) async {
    var endpoint = "/api/LoginOtp";
   // var url = host + endpoint;

// http get request with paraemeters
    final url = new Uri.http(host_withoutHTTP, endpoint, {
      "mobileno": mobileNumber,
      "countryid": "d70504d3-c323-e911-80e5-008cfa5ac2c5"
      });

    Map<String,String> headers = {
      'Content-type' : 'application/json', 
      'Accept': 'application/json',
    };
try {
  final response =
        await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    final status =response.statusCode;
    if (status == 200) {
      
       OtpLogin otplogin = OtpLogin(responseJson['Otp'], responseJson['userexist']);
   
    return otplogin;

    }
   
  
    } catch (exception) {
  //	print(exception);
   // logoutUser();
		return null;
  }
    
}

//Registeration with OTP verify new user and send otp

Future<OtpLogin> registerwithOTP(String mobileNumber) async {
    var endpoint = "/user/GetRegisterOtp";
   // var url = host + endpoint;

// http get request with paraemeters
    final url = new Uri.http(host_withoutHTTP, endpoint, {
      "CountryId": "d70504d3-c323-e911-80e5-008cfa5ac2c5",
      "mobileno": mobileNumber
     
      });

    Map<String,String> headers = {
      'Content-type' : 'application/json', 
      'Accept': 'application/json',
    };
try {
  final response =
        await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    final status =response.statusCode;
    if (status == 201) {
      
       OtpLogin otplogin = OtpLogin(responseJson['Otp'], responseJson['userexist']);
   
    return otplogin;

    }
    else if(status == 400){
      OtpLogin otpLogin =OtpLogin("1", true);
      return otpLogin;

    }
   
  
    } catch (exception) {
  //	print(exception);
   // logoutUser();
		return null;
  }
    
}




// Shared Preference to save value in cache for future references
Future<bool> saveTokenPreferences(String token) async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString("token", token);
  return prefs.commit();

}

Future<String> getTokenPreferences() async {
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  return token;
}


	Future<bool> logoutUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
		prefs.setString("token", null);
		return true;
	}

	showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
		scaffoldKey.currentState.showSnackBar(
			new SnackBar(
				content: new Text(message ?? 'You are offline'),
			)
		);
	}