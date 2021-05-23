
import 'dart:convert';

Courses CourseModelFromJson(String str) => Courses.fromJson(json.decode(str));

class Courses{

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
  double formalityPoint;
  double contentPoint;
  double presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  String instructorName;

  String userId;
  Courses({
    this.id,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.requirement,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.imageUrl,
    this.promoVidUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.instructorName




  });
  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      price:json["price"],
      description: json["description"],
      requirement: List<String>.from(json["requirement"].map((x) => x)),
      learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
      soldNumber: json["soldNumber"] ,
      ratedNumber: json["ratedNumber"].toDouble(),
      videoNumber:json["videoNumber"],
      totalHours: json["totalHours"].toDouble(),
      formalityPoint: json["formalityPoint"].toDouble() ,
      contentPoint: json["contentPoint"].toDouble(),
      presentationPoint: json["presentationPoint"].toDouble(),
      imageUrl: json["imageUrl"],
      promoVidUrl: json["promoVidUrl"] == null ? 'no data' : json["promoVidUrl"] as String,
      status: json["status"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      instructorId: json["instructorId"],
      instructorName: json["instructor.user.name"]


    );
  }

  


}


class CoursesSuggestion{

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
  double formalityPoint;
  double contentPoint;
  double presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  String instructorName;

  String userId;
  CoursesSuggestion({
    this.id,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.requirement,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.imageUrl,
    this.promoVidUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructorId,





  });
  factory CoursesSuggestion.fromJson(Map<String, dynamic> json) {
    return CoursesSuggestion(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        price:json["price"],
        description: json["description"],
        requirement: List<String>.from(json["requirement"].map((x) => x)),
        learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
        soldNumber: json["soldNumber"] ,
        ratedNumber: json["ratedNumber"].toDouble(),
        videoNumber:json["videoNumber"],
        totalHours: json["totalHours"].toDouble(),
        formalityPoint: json["formalityPoint"].toDouble() ,
        contentPoint: json["contentPoint"].toDouble(),
        presentationPoint: json["presentationPoint"].toDouble(),
        imageUrl: json["imageUrl"],
        promoVidUrl: json["promoVidUrl"] == null ? 'no data' : json["promoVidUrl"] as String,
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        instructorId: json["instructorId"],



    );
  }




}