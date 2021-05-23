import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';

class CourseSearch extends StatelessWidget{
  String image;
  String title;
  String name;
  int price;
  CourseSearch({this.image,this.title,this.name,this.price});
  @override
  Widget build(BuildContext context){
    return Center(
      child :Card(
        margin: EdgeInsets.only(bottom: 10),
        color: Colors.grey[900],
        elevation: 5,
        child: Container(
          width: double.infinity,

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
                        image: NetworkImage(image)
                    )
                ),
              ),
              Container(
                height: 100,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(child: Text(
                          title,

                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                          child: Text(name,textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                            ),),

                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                          child: Text(price.toString(),textAlign: TextAlign.center,
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


    );
  }
}
class TeacherSearch extends StatelessWidget{
  String avatar;
  String name;
  String num;
  TeacherSearch({this.avatar,this.name,this.num});
  Widget build(BuildContext context){
    return Center(
      child :Card(
        margin: EdgeInsets.only(bottom: 10),
        color: Colors.grey[900],
        elevation: 5,
        child: Container(
          width: double.infinity,

          child: Row(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 70.0,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(avatar)
                ),
              ),
              Container(
                height: 100,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            name,

                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                          child: Text(name,textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey
                            ),),

                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                          child: Text(num.toString(),textAlign: TextAlign.center,
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


    );
  }

}