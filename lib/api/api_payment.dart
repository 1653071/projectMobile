import 'package:flutter_app/model/model_payment.dart';
import 'package:http/http.dart' as http;
import'dart:convert';
class ApiPayment{
  Future<http.Response> FreeCourse(String token , String courseId) async{
    final url ="https://api.letstudy.org/payment/get-free-courses";
    final response=await http.post(Uri.parse(url),headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },body: {"courseId": courseId});
    return response;

  }
  Future<http.Response> CheckOwnCourse(String token,String courseId)async{
    String url ="https://api.letstudy.org/user/check-own-course/$courseId";
    final response = await http.get(Uri.parse(url),headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response;
  }
  Future<PaymentFree> CheckOwnCourse1(String token,String courseId)async{
    String url ="https://api.letstudy.org/user/check-own-course/$courseId";
    PaymentFree pf;
    final response = await http.get(Uri.parse(url),headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode ==200){
      var jsonData = json.decode(response.body);
      var data = jsonData["payload"];
      pf= PaymentFree.fromJson(data);
      return pf;


    }
    else{
      return pf;
    }

  }
}