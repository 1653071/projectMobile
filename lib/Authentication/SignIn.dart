import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/ForgetPassword.dart';
import 'package:flutter_app/api/api_login.dart';
import 'package:flutter_app/Courses/Home.dart';
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
  String message = '';
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
                          onPressed: () async{
                            if(globalFormKey.currentState.validate()){
                              var email= emailController.text;
                              var password = passwordController.text;
                              var phone= phoneController.text;
                              var username = usernameController.text;
                              ApiService api = new ApiService();

                              var rsp = await api.LoginUser(email, password);

                              print(rsp);
                              if(rsp['token'] != null){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
                                );
                              }

                              else
                              {
                                setState(() {
                                  message=rsp['message'];
                                });

                              }
                            }

                          },
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

