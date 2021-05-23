import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/SignIn.dart';
import 'package:flutter_app/api/api_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(ChangePassword());
}
class ChangePassword extends StatelessWidget {
  String id;
  ChangePassword({this.id});
  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      home: ChangePasswordPage(title: 'Change Password',id: id),
    );
  }
}
class ChangePasswordPage extends StatefulWidget {
  String id;
  ChangePasswordPage({Key key, this.title,this.id}) : super(key: key);



  final String title;

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState(id:id);
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final newpasswordController = TextEditingController();
  final oldpasswordController= TextEditingController();
  String token;
  String message = '';
  String msgLoginFail ='Change Success';
  String msgLoginFail1 ='You have change pass successful';
  String msgActivate='Change Fail';
  String msgActivate1='Please check again';
  String id;
  _ChangePasswordPageState({this.id});
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
  void initState() {
    _fetchNotes();


    super.initState();
  }
  _fetchNotes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");

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
                      child: Text("Old Password" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                    ),
                    Container(
                      padding:  EdgeInsets.only(top:10,left:20,right:20),
                      child: TextFormField(
                        obscureText: true,
                        controller: oldpasswordController,
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
                      alignment: Alignment.centerLeft,
                      child: Text("New Password" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                    ),
                    Container(
                      padding:  EdgeInsets.only(top:10,left:20,right:20),
                      child: TextFormField(
                        obscureText: true,
                        controller: newpasswordController,
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
                                  String newpass = newpasswordController.text;
                                  String oldpass = oldpasswordController.text;
                                  print(id);
                                  ApiService api = new ApiService();
                                  final response = await api.changePassword(token,id, oldpass, newpass);
                                  if (response.statusCode == 200) {
                                    _showcontent1(msgLoginFail,msgLoginFail1);
                                    SharedPreferences pref = await SharedPreferences.getInstance();
                                    pref.remove("token");
                                    pref.remove("is_login");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignIn()),
                                    );
                                  }
                                  else  {
                                    _showcontent2(msgActivate, msgActivate1);
                                  }
                                }
                              }
                              ,
                              child: Text(
                                'Change password',
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


            ],
          ),

        )
    );
  }
}

