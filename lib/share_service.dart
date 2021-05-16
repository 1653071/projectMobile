import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/login_model.dart';
import 'package:flutter_app/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedService{
   static Future<bool> isLoggedIn() async{
    final pref =  await SharedPreferences.getInstance();
    return pref.getString("login_details") != null ? true : false;
  }
  static Future<User> UserDetail() async{
     final pref = await SharedPreferences.getInstance();
     return pref.getString("user_detail") !=null
         ? User.fromJson(jsonDecode(pref.getString("user_detail"))):null;

  }
   static Future<void> setLoginDetails(LoginResponseModel loginResponse) async {
     final prefs = await SharedPreferences.getInstance();

     return prefs.setString("login_details",
         loginResponse != null ? jsonEncode(loginResponse.toJson()) : null);
   }
   static Future<void> logout() async {
     await setLoginDetails(null);
   }

}
