import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/courses/course_detail.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_withlesson.dart';
import 'package:flutter_app/model/teacher/teacher_detail_model.dart';
import 'package:flutter_app/share_service.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/Home.dart';
import 'package:flutter_app/api/api_courses.dart';
import 'package:flutter_app/model/courses/course_detail.dart';
import 'package:flutter_app/api/api_teacher.dart';

class IntroCourse extends StatelessWidget {
  String id;
  String idInstructor;
  IntroCourse({this.id,this.idInstructor});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: IntroCoursePage(id:id,idInstructor: idInstructor,),
    );
  }
}
class IntroCoursePage extends StatefulWidget {
  String id;
  String idInstructor;
  IntroCoursePage({this.id,this.idInstructor});
  @override
  _IntroCoursePageState createState() => _IntroCoursePageState(id:id,idInstructor: idInstructor);
}

class _IntroCoursePageState extends State<IntroCoursePage> {
   String id;
   String idInstructor;
   ApiProductService apiProductService= new ApiProductService();
   ApiTeacher apiTeacher= new ApiTeacher();
   TeacherDetail teacherDetail ;
   CourseDetail courseWithLessons;
   StatusFavorite coursesFavorite;
   bool _isLoading =false;
   String token;
  _IntroCoursePageState({this.id,this.idInstructor});

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
     token = pref.getString("token");
     courseWithLessons = await apiProductService.fetchCourseDetail(id);
     coursesFavorite = await apiProductService.StatusFavoriteCourse(id, token);
     teacherDetail = await apiTeacher.fetchTeacherBaseOnCourse(idInstructor);
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
                Text("Home", textAlign: TextAlign.center,),
                Text("Course", textAlign: TextAlign.center,),
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
          body: Builder(
            builder: (_){
              if(_isLoading)
                {
                  return Center(child:CircularProgressIndicator());
                }
              return SingleChildScrollView(
                child: Column(

                  children: <Widget>[

                    Center(child: Container(

                      child :Image.network(teacherDetail.avatar,
                        width: 600,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    )),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: Text(courseWithLessons.title,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    ),

                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 250,
                        height: 35,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 5),

                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        child :Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width : 35,
                              child:CircleAvatar(

                                  radius:15,
                                  backgroundImage: NetworkImage(teacherDetail.avatar)
                              ),),
                            TextButton(


                              style: TextButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: () { },
                              child :Text("${teacherDetail.name}",style: TextStyle(color: Colors.white,fontSize: 14),),
                            ),

                          ],),
                      ) ,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left:5),
                              child:Text("Beginner", style: TextStyle(color: Colors.white),)),
                          Container(
                              padding: EdgeInsets.only(left:5),
                              child:Text("Nov 12 2020", style: TextStyle(color: Colors.white),)),
                          Container(
                            padding: EdgeInsets.only(left:5),
                            child :SmoothStarRating(
                              rating: 5,
                              size: 20,
                              starCount: 5,
                              color: Colors.yellow,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10,left: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                              color: Colors.grey,
                              width: 1
                          ))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Column(
                            children: [

                              LikeButton(
                                size: 50,
                                likeBuilder: (bool isLiked){
                                  if(coursesFavorite.likeStatus == true){
                                    return Icon(
                                        Icons.favorite,
                                        color:  Colors.red,
                                        size :30
                                    );
                                  }
                                  else{
                                    if(isLiked){
                                      ApiProductService.LikeCourses(token, id);
                                      return Icon(
                                          Icons.favorite,
                                          color:  Colors.red,
                                          size :30
                                      );
                                    }
                                    else{
                                      return Icon(
                                          Icons.favorite,
                                          color:  Colors.white,
                                          size :30
                                      );
                                    }
                                  }
                                },



                              ),
                              Text("Favorite",style: TextStyle(color: Colors.white),)
                            ],
                          ),
                          Column(
                            children: [

                              LikeButton(
                                size: 50,
                                likeBuilder: (bool isLiked){
                                  if(coursesFavorite.likeStatus == true){
                                    return Icon(
                                        Icons.shopping_cart_outlined,
                                        color:  Colors.red,
                                        size :30
                                    );
                                  }
                                  else{
                                    if(isLiked){
                                      ApiProductService.LikeCourses(token, id);
                                      return Icon(
                                          Icons.shopping_cart_outlined,
                                          color:  Colors.red,
                                          size :30
                                      );
                                    }
                                    else{
                                      return Icon(
                                          Icons.shopping_cart_outlined,
                                          color:  Colors.white,
                                          size :30
                                      );
                                    }
                                    }
                                  }
                                ,



                              ),
                              Text("Buy",style: TextStyle(color: Colors.white),)
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(

                                  radius: 20,
                                  backgroundImage: NetworkImage('https://via.placeholder.com/140x100')
                              ),
                              Text("Subcribe",style: TextStyle(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(right: 10,left: 10,top: 10),
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1
                              ))
                      ),
                      child: Scrollbar(

                          child:SingleChildScrollView(
                              scrollDirection: Axis.vertical,


                              child :Text(courseWithLessons.description,
                                style: TextStyle(color: Colors.white),)
                          )
                      ),

                    ),
                    SizedBox(height: 20),
                    Container(
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Course Content", style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF0D1333),
                                          fontWeight: FontWeight.bold,
                                        )),
                                        SizedBox(height: 30),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 30),
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                "1",
                                                style: TextStyle(
                                                  fontSize: 28,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "mins",
                                                      style: TextStyle(
                                                        color: Color(0xFF0D1333).withOpacity(.5),
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    TextSpan(

                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Color(0xFF0D1333),
                                                        // fontWeight: FontWeight.bold,
                                                      ).copyWith(
                                                        fontWeight: FontWeight.w600,
                                                        height: 1.5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                margin: EdgeInsets.only(left: 20),
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green,
                                                ),
                                                child: Icon(Icons.play_arrow, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )



                                      ],
                                    ),
                                  ),
                                ])
                        ))



                  ],
                ),
              );
            },
          )

    );
  }
}
