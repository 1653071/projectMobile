import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/SignIn.dart';
import 'package:flutter_app/api/api_user.dart';
import 'package:http/http.dart' as http;
import'dart:convert';
void main() {
  runApp(ForgotPassword());
}
class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
    home: ForgotPasswordPage(title: 'Sign In'),
    );

  }
}

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: () {
                Navigator.pop(context);
              },
                child: Text("Back", textAlign: TextAlign.center,),),
              Text("ForgotPassword", textAlign: TextAlign.center,),
              SizedBox(width: 50,)
            ],
          )


      ),
      body: SingleChildScrollView(

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
                      child: Text("Email" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                    ),
                    Container(
                      padding:  EdgeInsets.only(top:10,left:20,right:20),
                      child: TextFormField(

                        controller: emailController,
                        validator: (value){
                          if(value.isEmpty){
                            return "Please input your email";
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
                                     String email = emailController.text;
                                     ApiService apiService = new ApiService();
                                     var response = await apiService.ForgotPassword(email);
                                     var jsonData = json.decode(response.body);

                                     if(response.statusCode==200)
                                       {
                                         _showcontent2("Send email successful", "You send email to reset password, please check your email");
                                       }
                                     else{
                                       _showcontent2("Emmail does not exist", "Email have been put is not exist. Please check Email correct??");
                                     }
                                }
                              }
                              ,
                              child: Text(
                                'Send to Email',
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
          )
      ),
    );
  }
}

