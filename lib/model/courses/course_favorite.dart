class StatusFavorite{
  bool likeStatus;
  StatusFavorite({this.likeStatus});
  factory StatusFavorite.fromJson(Map<String , dynamic> json){
    return StatusFavorite(
      likeStatus: json["likeStatus"]
    );
  }
}
class FavoriteCourses{
  String id;
  String courseTitle;
  int coursePrice;
  String courseImage;
  String instructorId;
  String instructorName;
  FavoriteCourses({this.id,this.courseTitle,this.coursePrice,this.courseImage,this.instructorId,this.instructorName});
  factory FavoriteCourses.fromJson(Map<String,dynamic> json){
    return FavoriteCourses(
      id: json["id"],
      courseTitle: json["courseTitle"],
      coursePrice: json["coursePrice"],
      courseImage: json["courseImage"],
      instructorId: json["instructorId"],
      instructorName: json["instructorName"]
    );
  }
}