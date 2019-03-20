import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:returndex/model/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'auth_utils.dart';

class NetworkUtils {
	static final String host = developmentHost;
	static final String productionHost = 'https://api.returndex.com';
	static final String developmentHost = 'http://rdapi.cashaa.news/';

	static authenticateUser(String mobile, String logintype, String password) async {
		var uri = host + AuthUtils.endPoint;

		try {
			final response = await http.post(
	     	Uri.encodeFull(uri),
				body: {
          'loginType': logintype,
          'Mobile': mobile,
          'CountryId': "d70504d3-c323-e911-80e5-008cfa5ac2c5",
          'Password': password
				},
        headers: {"Accept":"application/json"}
			);
     

      
      var jsonData = json.decode(response.body);
      print("faraaz"+jsonData);

			final responseJson = json.decode(response.body);
      
			return responseJson;

		} catch (exception) {
			print(exception);
			if(exception.toString().contains('SocketException')) {
				return 'NetworkError';
			} else {
				return null;
			}
		}
	}






	static logoutUser(BuildContext context, SharedPreferences prefs) {
		prefs.setString(AuthUtils.authTokenKey, null);
		prefs.setInt(AuthUtils.userIdKey, null);
		prefs.setString(AuthUtils.nameKey, null);
		Navigator.of(context).pushReplacementNamed('/');
	}

	static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
		scaffoldKey.currentState.showSnackBar(
			new SnackBar(
				content: new Text(message ?? 'You are offline'),
			)
		);
	}

	static fetch(var authToken, var endPoint) async {
		var uri = host + endPoint;

		try {
			final response = await http.get(
				uri,
				headers: {
					'Authorization': authToken
				},
			);

			final responseJson = json.decode(response.body);
			return responseJson;

		} catch (exception) {
			print(exception);
			if(exception.toString().contains('SocketException')) {
				return 'NetworkError';
			} else {
				return null;
			}
		}
	}
}