import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MenuSetting());
}
class MenuSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey,
          )),
      home: MenuSettingPage(),
    );
  }
}
class MenuSettingPage extends StatefulWidget {
  @override
  _MenuSettingPageState createState() => _MenuSettingPageState();
}

class _MenuSettingPageState extends State<MenuSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(child: Text("Setting",textAlign: TextAlign.center,)),


        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children :<Widget> [
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
                      text: TextSpan(text: "Account",
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
                      width: 2
                  ))
              ),
              child: Row(
                children:<Widget> [
                  RichText(
                      text: TextSpan(text: "Theme",
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
                      width: 2
                  ))
              ),
              child: Row(
                children:<Widget> [
                  RichText(
                      text: TextSpan(text: "Send feedback",
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
                      width: 2
                  ))
              ),
              child: Row(
                children:<Widget> [
                  RichText(
                      text: TextSpan(text: "Contact support",
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

