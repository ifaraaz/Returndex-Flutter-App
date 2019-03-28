import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ReturnDex/model/Auth.dart';
import 'package:ReturnDex/model/taglist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';

 
 
 	final String host = developmentHost;
  final String host_withoutHTTP = developmentHost_withoutHTTP;
	final String productionHost = 'https://api.returndex.com';
	final String developmentHost = 'http://rdapi.cashaa.news/';
  final String productionHost_withoutHTTP = "api.returndex.com";
  final String developmentHost_withoutHTTP = "rdapi.cashaa.news";

   String authToken = "";

//--------Internet Connectiviy Check ----------------
Future<bool> internetConnectivityCheck() async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          return true;
        } else if (connectivityResult == ConnectivityResult.wifi) {
          return true;
        }
        return false;
      }


//----------------------END----------------

//------------------LOgin USER---------------
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
         final status =response.statusCode;
    
   
    if (status == 201) {
      final responseJson = json.decode(response.body);
       UserDetails user = UserDetails(responseJson['AccessToken'], responseJson['Mobileno'],"Login Successfully");
   if (user.accessToken.isNotEmpty) {
     saveTokenPreferences(user.accessToken);
    return user;
    }
    else {
      return null;

    }
   
  }
  else if(status == 400)
  {
    //inalid request
    UserDetails user =UserDetails("", "", "Invalid Request");
    return user;

  }
  else if(status == 401){
     UserDetails user =UserDetails("", "", "Incorrect Login Credentials !");
    return user;
  }
  else {
    return null;
  }
   
  
} catch (exception) {
  //	print(exception);
    logoutUser();
		return null;
}
    
}

// this is used when user login with OTP
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

//--------------------END-------------

//verify register OTP and register new user 

 Future<UserDetails> registerNewUser(String mobileNumber,String password) async {
    var endpoint = "user/register";
    var url = host + endpoint;
    var body = json.encode({
          "Password": password,
          "CountryId": "d70504d3-c323-e911-80e5-008cfa5ac2c5",
          "Mobile": mobileNumber,
          "Name": "NA",
          "userType": 1,
          "registertype": 1,
          "Email": "na@xyz.n"        
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
      //send to login on successfull register
      authenticateUser("1", mobileNumber, password);
      UserDetails user =UserDetails("", mobileNumber,"");
      return user;
      
    } 
} catch (exception) {
  //	print(exception);
    logoutUser();
		return null;
  } 
}

//-------------------END-------------------



//--------------Activate Tag----------------Token Required

Future<activateTag> activateUniqueTag(String uniqueID) async {
    var auth_Token =getTokenPreferences();
    if (authToken != "") {
   
    String authorization = "Basic "+authToken;
     print(authorization);


    var endpoint = "user/ActivateTag";
    var url = host + endpoint;
    var body = json.encode({
          "tagno": uniqueID,      
      });


    Map<String,String> headers = {
      'Content-Type' : 'application/json', 
      'Accept': 'application/json',
      'Authorization':authorization,
    };
try {
  final response =
        await http.post(url, body: body, headers: headers);
    
    final status =response.statusCode;
    print(status);
   
    if (status == 201) {
       final responseJson = json.decode(response.body);
       activateTag tag = activateTag(responseJson['InValid'], responseJson['tagnumber'],responseJson['isActive']);
   
       return tag;

    }
    else {
     
      return null;

    }
   
  
    } catch (exception) {
  //	print(exception);
   // logoutUser();
		return null;
  }
    }
    else{
      logoutUser();
    }
}

//--------------------END-------------

//----------------GET Activated Tag List -----------Token based
Future<List<TotaltagList>> getActivatedTagList(BuildContext context) async {
    var endpoint = "/user/GetTagList";
   var auth_Token =getTokenPreferences();
    if (authToken != "") {
   
    String authorization = "Basic "+authToken;
     print(authorization);

// http get request with paraemeters
    final url = new Uri.http(host_withoutHTTP, endpoint, {
      "requestModel.page": '1',
      "requestModel.take": "10"
      });

    Map<String,String> headers = {
      'Content-Type' : 'application/json', 
      'Accept': 'application/json',
      'Authorization':authorization,
    };
try {
  final response =
        await http.get(url, headers: headers);
   
    final status =response.statusCode;
    print(status);
    print("status");
     List<TotaltagList> listoftags = [];
    if (status == 200) {
       final responseJson = json.decode(response.body);
       final jsondata =responseJson["Items"];
      

       for (var u in jsondata) {
         
         TotaltagList tag = TotaltagList(u["tagnumber"],u["isActive"]);
         if (tag.isActive == true) 
         {
          tag.isActive = "Active"; 
         }
         else{
           tag.isActive = "Error"; 
         }
          
          listoftags.add(tag);
         
       }

      
      print(listoftags.length);
      if (listoftags.length == 0) {
        TotaltagList tag = TotaltagList("No Tags Found ","Please activate your tag");
        listoftags.add(tag);
      }
      
     
      return listoftags;
}
else if(status == 401){
logoutUser();
Navigator.of(context).pop();
Navigator.of(context).pushReplacementNamed('/login');

}
else{
  TotaltagList tag = TotaltagList("No Tags Found"," ");
  listoftags.add(tag);
  return listoftags;

}
   
   
  
    } catch (exception) {
  //	print(exception);
   // logoutUser();
		return null;
  }
    
}
}

//---------------------------END-------------------



// Shared Preference to save value in cache for future references
Future<bool> saveTokenPreferences(String token) async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString("token", token);
  return prefs.commit();

}

 Future<String> getTokenPreferences() async {
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  authToken =token;
  return token;
}

getAuthTokenString() async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  return token;
}

	Future<bool> logoutUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
		prefs.setString("token", null);
     prefs.clear();
     
     
		return true;
	}

	showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
		scaffoldKey.currentState.showSnackBar(
			new SnackBar(
				content: new Text(message ?? 'You are offline'),
			)
		);
	}
  