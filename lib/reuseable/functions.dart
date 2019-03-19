import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

Future<String> getApiData(String apiFunction) async {
    String url = 'http://rdapi.cashaa.news/user/';
    String finalurl = url + apiFunction;
    final response =
        await http.get(finalurl);

var jsonData = json.decode(response.body);
return jsonData;
  }