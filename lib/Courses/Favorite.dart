import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/api_courses.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
void main() {
  runApp(Favorite());
}
class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: FavoritePage(),
    );
  }
}
class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  ApiProductService apiProductService = new ApiProductService();
  bool _isLoading =false;
  List<FavoriteCourses> favoritecourses;
  String token;
  @override


  @override
  void initState() {
    _fetchNotes();


    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });


    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");
    favoritecourses = await apiProductService.FavoriteCoursesOfUser(token);


    setState(() {
      _isLoading = false;
    });
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
                child: Text("Back", textAlign: TextAlign.center,),),
              Text("Favorite", textAlign: TextAlign.center,),
              SizedBox(width: 30,)

            ],
          )


        ),
        body: Builder(
          builder: (_){
            if(_isLoading){
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: favoritecourses.length,
                itemBuilder: (context,index){
                return InkWell(
                  child: Center(
                    child :Card(
                                color: Colors.black54,
                                elevation: 5,
                                child: Container(
                                  height: 100.0,
                                  width: 500,
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
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(favoritecourses[index].courseImage)
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
                                                Text(
                                                  favoritecourses[index].courseTitle,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                                  child: Text(favoritecourses[index].instructorName,textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey
                                                    ),),

                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                                  child: Text(favoritecourses[index].coursePrice.toString(),textAlign: TextAlign.center,
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


                  ),
                );
                });
          },
        )
    );
  }
}
