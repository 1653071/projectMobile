import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/Home.dart';
void main() {
  runApp(AccountHome());
}
class AccountHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: AccountHomePage(),
    );
  }
}
class AccountHomePage extends StatefulWidget {
  @override
  _AccountHomePageState createState() => _AccountHomePageState();
}

class _AccountHomePageState extends State<AccountHomePage> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
                child: Text("Home", textAlign: TextAlign.center,),),
              Text("Account", textAlign: TextAlign.center,),
              InkWell(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
                child: Text("Back", textAlign: TextAlign.center,),),
            ],
          )


      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.only(top:30),
              child: CircleAvatar(

                  radius: 100,
                  backgroundImage: NetworkImage('https://www.w3schools.com/w3images/avatar2.png')
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top:15),
            child:Center(

                child:Text("Quang",style: TextStyle(color: Colors.white,fontSize: 30),)
            )
          ),
          SizedBox(height: 40,),

          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
              child: Text(
            "Name",
            style: TextStyle(color: Colors.white,fontSize: 20)
            ,)
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                "Nguyen Minh Quang",
                style: TextStyle(color: Colors.grey,fontSize: 16)
                ,)
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                "Phone",
                style: TextStyle(color: Colors.white,fontSize: 20)
                ,)
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                "123456789",
                style: TextStyle(color: Colors.grey,fontSize: 16)
                ,)
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
                child: Text(
                  'Sign out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}

