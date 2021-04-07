import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/IntroCourse.dart';
import 'package:flutter_app/Courses/Home.dart';
void main() {
  runApp(New());
}
class New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey,
          )),
      home: NewPage(),
    );
  }
}

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
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
              Text("Home", textAlign: TextAlign.center,),
              Text("New", textAlign: TextAlign.center,),
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
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),

            children: <Widget>[
              Card(
                color: Colors.black54,
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)
                    ),

                ),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IntroCourse()),
                        );
                      },
                      child: Ink.image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://miro.medium.com/max/3356/1*-6WdIcd88w3pfphHOYln3Q.png",
                          )
                      )
                  ),
              ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => IntroCourse()),
                                  );
                                  },
                                child:Text(
                                  "Build app with flutetr",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                  ),
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                child: Text("CopyHouse",textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                ),),

                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                              child: Text("CopyHouse",textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                ),),

                            ),
                            Container(
                              padding: EdgeInsets.only(top:5),
                              child :SmoothStarRating(
                                rating: 5,
                                size: 20,
                                starCount: 5,
                                color: Colors.yellow,
                              ),)
                          ]
                      ),
                    ),
                  )
              ],
              ),
            ),
              ),
              Card(

                color: Colors.black54,
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),

                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/3356/1*-6WdIcd88w3pfphHOYln3Q.png",
                                )
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => IntroCourse()),
                                      );
                                    },
                                    child:Text(
                                      "Build app with flutetr",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Container(
                                  padding: EdgeInsets.only(top:5),
                                  child :SmoothStarRating(
                                    rating: 5,
                                    size: 20,
                                    starCount: 5,
                                    color: Colors.yellow,
                                  ),)
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(

                color: Colors.black54,
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),

                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/3356/1*-6WdIcd88w3pfphHOYln3Q.png",
                                )
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => IntroCourse()),
                                      );
                                    },
                                    child:Text(
                                      "Build app with flutetr",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Container(
                                  padding: EdgeInsets.only(top:5),
                                  child :SmoothStarRating(
                                    rating: 5,
                                    size: 20,
                                    starCount: 5,
                                    color: Colors.yellow,
                                  ),)
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(

                color: Colors.black54,
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),

                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/3356/1*-6WdIcd88w3pfphHOYln3Q.png",
                                )
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => IntroCourse()),
                                      );
                                    },
                                    child:Text(
                                      "Build app with flutetr",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Container(
                                  padding: EdgeInsets.only(top:5),
                                  child :SmoothStarRating(
                                    rating: 5,
                                    size: 20,
                                    starCount: 5,
                                    color: Colors.yellow,
                                  ),)
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(

                color: Colors.black54,
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),

                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/3356/1*-6WdIcd88w3pfphHOYln3Q.png",
                                )
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => IntroCourse()),
                                      );
                                    },
                                    child:Text(
                                      "Build app with flutetr",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Container(
                                  padding: EdgeInsets.only(top:5),
                                  child :SmoothStarRating(
                                    rating: 5,
                                    size: 20,
                                    starCount: 5,
                                    color: Colors.yellow,
                                  ),)
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(

                color: Colors.black54,
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),

                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/3356/1*-6WdIcd88w3pfphHOYln3Q.png",
                                )
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => IntroCourse()),
                                      );
                                    },
                                    child:Text(
                                      "Build app with flutetr",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Container(
                                  padding: EdgeInsets.only(top:5),
                                  child :SmoothStarRating(
                                    rating: 5,
                                    size: 20,
                                    starCount: 5,
                                    color: Colors.yellow,
                                  ),)
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(

                color: Colors.black54,
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 70.0,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),

                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/3356/1*-6WdIcd88w3pfphHOYln3Q.png",
                                )
                            )
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => IntroCourse()),
                                      );
                                    },
                                    child:Text(
                                      "Build app with flutetr",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                  child: Text("CopyHouse",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),

                                ),
                                Container(
                                  padding: EdgeInsets.only(top:5),
                                  child :SmoothStarRating(
                                    rating: 5,
                                    size: 20,
                                    starCount: 5,
                                    color: Colors.yellow,
                                  ),)
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}



