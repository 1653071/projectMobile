import'dart:convert';
class LoginResponseModel {
  final String token;


  LoginResponseModel({this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : ""
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'token': token.trim(),
    };

    return map;
  }
}
