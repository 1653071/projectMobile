import 'package:flutter_app/model/courses/courses_model.dart';

class Category{
  String id;
  String name;
  Category({this.id,this.name});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"]
    );
  }
}