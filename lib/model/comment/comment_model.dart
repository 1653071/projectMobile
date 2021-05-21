class CommentModel{
String id;
String userId;
String courseId;
String content;
DateTime updatedAt;
UserComment user;
CommentModel({this.id,this.userId,this.courseId,this.content,this.updatedAt,this.user});
factory CommentModel.formJson(Map<String,dynamic> json){
  return CommentModel(
    id: json["id"],
    userId: json["userId"],
    courseId: json["courseId"],
    content: json["content"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    user: UserComment.fromJson(json["user"])
    
  );
}

}
class UserComment{
  String id;
  String avatar;
  String name;
  UserComment({this.id,this.avatar,this.name});
  factory UserComment.fromJson(Map<String , dynamic> json){
    return UserComment(
      id: json["id"],
      avatar: json["avatar"],
      name:json["name"]
    );
  }
}