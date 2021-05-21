import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/ForgetPassword.dart';
import 'package:flutter_app/api/api_login.dart';
import 'package:flutter_app/Courses/Home.dart';
import 'package:flutter_app/model/login_model.dart';
import 'package:flutter_app/share_service.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/share_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(SignIn());
}
class SignIn extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      home: SignInPage(title: 'Sign up'),
    );
  }
}
class SignInPage extends StatefulWidget {
  SignInPage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController= TextEditingController();
  final phoneController = TextEditingController();
  final passwordController= TextEditingController();
  LoginResponseModel loginResponseModel = new LoginResponseModel();
  String message = '';
  String msgLoginFail ='Login Fail';
  String msgLoginFail1 ='You log in false. Please check you have right username or password';
  String msgActivate='Activate';
  String msgActivate1='Please activate your email';

  void _showcontent1(String msg,String msg1) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(msg),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(msg1),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () async {
                String email=emailController.text;
                ApiService api = new ApiService();
                var response = await api.ActivateEmail(email);
                if(response.statusCode==200)
                {

                }
                else{

                }
                // ignore: unrelated_type_equality_checks


              },
            ),
            new FlatButton(
              child: new Text('Cancle'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showcontent2(String msg,String msg1) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(msg),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(msg1),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title,textAlign: TextAlign.center,)),
        backgroundColor: Colors.grey[800],

      ),
      body:SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Form(
              key:globalFormKey,
              child: Column(
                children: [
                  Container(
                    padding:  EdgeInsets.only(top:20,left:20,right:20),
                    alignment: Alignment.centerLeft,
                    child: Text("Email or username" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                  ),
                  Container(
                    padding:  EdgeInsets.only(top:10,left:20,right:20),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Email can not empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          filled:true,
                          fillColor: Colors.grey,
                          labelStyle: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          )
                      ),
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.only(top:10,left:20,right:20),
                    alignment: Alignment.centerLeft,
                    child: Text("Password" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                  ),
                  Container(
                    padding:  EdgeInsets.only(top:10,left:20,right:20),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Password can not empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(

                          filled:true,
                          fillColor: Colors.grey,
                          labelStyle: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          )
                      ),
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.only(top:10,left:20,right:20),
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      shadowColor: Colors.blue,
                      color: Colors.blue,
                      elevation: 7.0,
                      child : Center(

                        child : TextButton(
                          onPressed: () async {
                            if (globalFormKey.currentState.validate()) {
                              var email = emailController.text;
                              var password = passwordController.text;
                              var phone = phoneController.text;
                              var username = usernameController.text;
                              ApiService api = new ApiService();


                              String url = "https://api.letstudy.org/user/login";
                              final response = await http.post(Uri.parse(
                                  "https://api.letstudy.org/user/login"),
                                  body: {'email': email, 'password': password}
                              );
                              if (response.statusCode == 403) {
                                _showcontent1(msgActivate, msgActivate1);
                              }
                              else if (response.statusCode == 400) {
                                _showcontent2(msgLoginFail, msgLoginFail1);
                              }
                              else if (response.statusCode == 200) {
                                var convertdatatoJson = jsonDecode(
                                    response.body);
                                var jsonData = jsonDecode(response.body);

                                String token = jsonData["token"];
                                  SharedService.SetUserLogin(token);
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                  String token1 = prefs.getString("token");
                                  print(token1);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Home()),
                                  );

                              }
                            }
                          }
                        ,
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        )
                      ),

                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:  EdgeInsets.only(top:10,left:20,right:20),
              alignment: Alignment.center,
              child:InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                child: Text("Forget Password?" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
              )

            ),
            Container(
              margin:  EdgeInsets.only(top:10,left:20,right:20),
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.blue,width: 2),
                borderRadius: BorderRadius.circular(5),
              ),


              child: Material(


                shadowColor: Colors.black,
                color: Colors.black,
                elevation: 7.0,
                child : Center(
                  child: Text(
                    'Use single sign-on(SSO)',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),

              ),
            ),
            Container(
              margin:  EdgeInsets.only(top:10,left:20,right:20),
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.blue,width: 2),
                borderRadius: BorderRadius.circular(5),
              ),


              child: Material(
                shadowColor: Colors.black,
                color: Colors.black,
                elevation: 7.0,

                child: Center(child: Text(

                  'Subscribe to PluralSight',

                  style: TextStyle(

                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),),


              ),
            ),
          ],
        ),

      )
    );
  }
}

