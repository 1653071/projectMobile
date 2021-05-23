import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/user/user_model.dart';
import 'package:http/http.dart' as http;
import'dart:convert';
class ApiService{
  Future  RegisterUser(String username,String email,String password,String phone) async{

    String url="https://api.letstudy.org/user/register";
    final response = await http.post(Uri.parse("https://api.letstudy.org/user/register"),
        body:{'username':username , 'email':email,'password':password,'phone':phone}
    );


      var convertdatatoJson =jsonDecode(response.body);
      return convertdatatoJson;




  }
  Future<http.Response> ForgotPassword(String email) async {
    String url= "https://api.letstudy.org/user/forget-pass/send-email";
    final response =await http.post(Uri.parse(url),
        body:{'email':email}
    );
    return response;
  }
  Future LoginUser(String email,String password) async{
    String url = "https://api.letstudy.org/user/login";
    final response = await http.post(Uri.parse("https://api.letstudy.org/user/login"),
        body:{'email':email,'password':password}
    );

    var convertdatatoJson =jsonDecode(response.body);
    return response;
  }
  Future<http.Response> ActivateEmail(String email) async{
    String url="https://api.letstudy.org/user/send-activate-email";
    int a;
    final response = await http.post(Uri.parse(url),
        body:{'email':email}
    );
    return response;
  }
  Future<http.Response> Activate(String token) async{
    String url="https://api.letstudy.org/user/activate-email";
    final response = await http.put(Uri.parse(url),
        body:{'token':token}
    );
    return response;
  }
  Future<User> getUserInfo(String token) async {
    String url = "https://api.letstudy.org/user/me";
    User user;
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonData = jsonDecode(response.body);
    var userData = jsonData["payload"];
    user = User.fromJson(userData);
    return user;
  }
  Future<http.Response> changePassword(String token,String id,String oldpass,String newpass) async {
    String url ="https://api.letstudy.org/user/change-password";
    final response = await http.post(Uri.parse(url),headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },body: {'id':id,'oldPass':oldpass,'newPass':newpass},

    );
    return response;

  }
  Future<User> updateInfo(String token,String name , String avatar,String phone) async {
    String url ="https://api.letstudy.org/user/update-profile";
    User user;
    final response = await http.put(Uri.parse(url),headers: {
      'Authorization': 'Bearer $token',
    },body: {"name": name,
      "avatar": avatar,
      "phone": phone});
    var jsonData = json.decode(response.body);
    var userData = jsonData["payload"];
    user = User.fromJson(userData);
    return user;


  }

}

