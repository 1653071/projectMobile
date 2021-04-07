import 'package:flutter/material.dart';
void main() {
  runApp(ForgotPassword());
}
class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title,textAlign: TextAlign.center,)),


        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children :<Widget> [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                
                child: Row(
                  children:<Widget> [
                    RichText(
                        text: TextSpan(text: "Forgot password",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            )
                        )
                    ),
                    Spacer()
                    ,
                    IconButton(
                        icon:Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,) , onPressed: (){})
                  ],
                ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                      color: Colors.grey,
                      width: 3
                  ))
              ),
              child: Row(
                children:<Widget> [
                  RichText(
                      text: TextSpan(text: "Subcribe to Pluralsight",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      )
                  ),
                  Spacer()
                  ,
                  IconButton(
                      icon:Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,) , onPressed: (){})
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                      color: Colors.grey,
                      width: 3
                  ))
              ),
              child: Row(
                children:<Widget> [
                  RichText(
                      text: TextSpan(text: "Restore subcription with iTunes",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      )
                  ),
                  Spacer()
                  ,
                  IconButton(
                      icon:Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,) , onPressed: (){})
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                      color: Colors.grey,
                      width: 3
                  ))
              ),
              child: Row(
                children:<Widget> [
                  RichText(
                      text: TextSpan(text: "Contact PlutralSight support",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      )
                  ),
                  Spacer()
                  ,
                  IconButton(
                      icon:Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,) , onPressed: (){})
                ],
              ),
            )
          ],



        )
    );

  }
}

