class User{
  String id;
  String email;
  String avatar;
  String name;
  List<String> favoriteCategories;
  String phone;
  User({this.id,this.email,this.avatar,this.name,this.favoriteCategories,this.phone});
  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json["id"],
      email: json["email"],
      avatar: json["avatar"],
      name: json["name"],
      favoriteCategories: List<String>.from(json["favoriteCategories"].map((x) => x)),

      phone: json["phone"],


    );
  }
}