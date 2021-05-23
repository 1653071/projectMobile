import 'dart:convert';


class CourseDetail{

  String id;
  String title;
  String subtitle;
  int price;
  String description;
  List<String> requirement;
  List<String> learnWhat;
  // int soldNumber;
  double ratedNumber;
  // int videoNumber;
  // double totalHours;
  // int formalityPoint;
  // int contentPoint;
  // int presentationPoint;
  String imageUrl;
  String promoVidUrl;
  // String status;
  // DateTime createdAt;
  // DateTime updatedAt;
  String instructorId;
  // List<String> categoryIds;

  String userId;
  CourseDetail({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.price,
    this.requirement,
    this.learnWhat,
    this.ratedNumber,
    this.imageUrl,
    this.promoVidUrl,
    this.instructorId



  });
  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      description: json["description"],
      price:json["price"],
    requirement: List<String>.from(json["requirement"].map((x) => x)),
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    ratedNumber: json["ratedNumber"].toDouble(),
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"],
    instructorId: json["instructorId"]


    );





}