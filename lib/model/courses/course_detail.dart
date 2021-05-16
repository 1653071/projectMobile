import 'dart:convert';


class CourseDetail{

  String id;
  String title;
  String subtitle;
  int price;
  String description;
  List<String> requirement;
  List<String> learnWhat;
  int soldNumber;
  double ratedNumber;
  int videoNumber;
  double totalHours;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  List<String> categoryIds;

  String userId;
  CourseDetail({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.price,



  });
  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      description: json["description"],
      price:json["price"],


    );





}