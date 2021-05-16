import 'package:flutter/cupertino.dart';
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
}

