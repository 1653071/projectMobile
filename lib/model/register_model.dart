class RegisterModel{
  String username;
  String email;
  String phone;
  String password;
  RegisterModel({this.username,this.email,this.phone,this.password});
  Map<String ,dynamic> toJson(){
    Map<String , dynamic> map ={
      'username':username.trim(),
      'email':email.trim(),
      'phone':phone.trim(),
      'password':password.trim(),
    };
  }
}