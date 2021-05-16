import 'package:flutter_app/model/courses/courses_model.dart';
import 'dart:convert';
class Teacher{
  String id;
  String userId;
  String major;
  String intro;
  List<String> skills;

  DateTime createAt;
  DateTime updateAt;
  String userid;
  String useremail;
  String useravatar;
  String username;
  int point;
  String phone;
  String type;
  Teacher({this.id,
    this.userId,
    this.major,
    this.intro,
    this.skills,
    this.createAt,
    this.updateAt,
    this.userid,
    this.useremail,
    this.useravatar,
    this.username,
    this.point,
    this.phone,
    this.type
});
  factory Teacher.fromJson(Map<String,dynamic> json){
    return Teacher(
      id: json["id"],
      userId: json["userId"],
      major: json["major"],
      intro: json["intro"],
      skills:List<String>.from(json["skills"].map((x)=>x)),
      createAt: DateTime.parse(json["createdAt"]),
      updateAt: DateTime.parse(json["updatedAt"]),
      userid: json["user.id"],
      useremail: json["user.email"],
      useravatar: json["user.avatar"],
      username: json["user.name"],
      point: json["user.point"],
      phone: json["user.phone"],
      type: json["user.type"]
    );
  }
}