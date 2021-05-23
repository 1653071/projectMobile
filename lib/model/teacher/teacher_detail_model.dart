import 'dart:convert';
class TeacherDetail{
  String id;
  String userId;
  String name;
  String email;
  String avatar;
  String phone;
  String major;
  String intro;
  List<String> skills;

  DateTime createAt;
  DateTime updateAt;
  int totalCourse;
  double averagePoint;
  int countRating;
  int ratedNumber;
  int soldNumber;
  TeacherDetail({this.id,this.userId,this.name,this.email,this.avatar,this.phone,this.major,this.intro,this.skills,this.createAt,this.updateAt,this.totalCourse,
    this.averagePoint,this.countRating,this.ratedNumber,this.soldNumber});
  factory TeacherDetail.fromJson(Map<String,dynamic> json){
    return TeacherDetail(
      id: json["id"],
      userId: json["userId"],
      name: json["name"],
      email: json["email"],
        avatar: json["avatar"],
      phone: json["phone"],
      major: json["major"],
      intro: json["intro"],
      skills: List<String>.from(json["skills"].map((x) => x)),
      createAt: DateTime.parse(json["createdAt"]),
      updateAt: DateTime.parse(json["updatedAt"]),
      totalCourse: json["totalCourse"],
      averagePoint: json["averagePoint"].toDouble(),
      countRating: json["countRating"],
      ratedNumber: json["ratedNumber"],
      soldNumber: json["soldNumber"]

    );
  }
}