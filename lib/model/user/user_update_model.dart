class UserUpdateModel{
  String name;
  String avatar;
  String phone;
  UserUpdateModel({this.name,this.avatar,this.phone});
  factory UserUpdateModel.fromJson(Map<String,dynamic> json){
    return UserUpdateModel(
      name: json["name"],
      avatar: json["avatar"],
      phone: json["phone"],
    );
  }
}
