import 'dart:convert';
class SearchData {
  String title;
  String id;
  int price;
  String description;
  List<String> learnWhat;
  int soldNumber;
  double ratedNumber;
  double formalityPoint;
  double contentPoint;
  double presentationPoint;
  int videoNumber;
  double totalHours;
  String imageUrl;

  DateTime updatedAt;
  String name;
  SearchData({this.title,this.id,this.price,this.description,this.learnWhat,this.soldNumber,this.ratedNumber
      ,this.formalityPoint,this.contentPoint,this.presentationPoint
  ,this.videoNumber,this.totalHours,this.imageUrl,this.updatedAt,this.name});
  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
      title: json["title"],
      id: json["id"],
      price:json["price"],
      description: json["description"],
      learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
      soldNumber: json["soldNumber"] ,
      ratedNumber: json["ratedNumber"].toDouble(),
      formalityPoint: json["formalityPoint"].toDouble() ,
      contentPoint: json["contentPoint"].toDouble(),
      presentationPoint: json["presentationPoint"].toDouble(),
      videoNumber:json["videoNumber"],
      totalHours: json["totalHours"].toDouble(),
      imageUrl: json["imageUrl"],

      updatedAt: DateTime.parse(json["updatedAt"]),
      name: json["name"]
    );
  }
}
class TeacherData{
  String id;
  String name;
  String avatar;
  String numcourses;
  TeacherData({this.id,this.name,this.avatar,this.numcourses});
  factory TeacherData.fromJson(Map<String , dynamic> json){
    return TeacherData(
      id: json["id"],
      name: json["name"],
      avatar: json["avatar"],
      numcourses: json["numcourses"]
    );
  }

}