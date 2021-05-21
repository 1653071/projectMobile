import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/api_payment.dart';
import 'package:flutter_app/custom.dart';
import 'package:flutter_app/model/comment/comment_model.dart';
import 'package:flutter_app/model/courses/course_detail.dart';
import 'package:flutter_app/model/courses/course_favorite.dart';
import 'package:flutter_app/model/courses/course_withlesson.dart';
import 'package:flutter_app/model/model_payment.dart';
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
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import'dart:convert';
void main() {
  runApp(IntroCourse(id:"84680304-032c-475a-b2a6-bd6f6efd8035",idInstructor: "92bfd9f0-9425-4d6e-912d-2387218fe330",));
}
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
   ApiPayment apiPayment = new ApiPayment();
   ApiTeacher apiTeacher= new ApiTeacher();
   PaymentFree pf = new PaymentFree();
   List<CommentModel> comments;
   TeacherDetail teacherDetail ;
   CourseDetail courseWithLessons;
   StatusFavorite coursesFavorite;
   bool isOwnUser;
   bool _isLoading =false;
   String token;
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
     comments = await apiProductService.fetchCommentofCourse(id);
     pf= await apiPayment.CheckOwnCourse1(token, id);
       if(pf.isUserOwnCourse==true){
         isOwnUser= true;
       }
       else{
         isOwnUser= false;
       }


     setState(() {
       _isLoading = false;
     });
   }
   Future<bool> onLikeButtonTapped(bool isLiked) async{
     /// send your request here
     // final bool success= await sendRequest();

     /// if failed, you can do nothing
     // return success? !isLiked:isLiked;

     return !isLiked;
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

                      child :Image.network(courseWithLessons.imageUrl,
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
                              child:Text(courseWithLessons.price.toString(), style: TextStyle(color: Colors.white),)),

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
                              InkWell(
                                onTap: () async {
                                  if(isOwnUser==true) {
                                    _showcontent1("Result", "Already buy a course");
                                  }
                                  else{
                                    var response= await apiPayment.FreeCourse(token, id);
                                    if(response.statusCode==200){
                                      _showcontent1("Result", "Buy successful");

                                    }
                                    else{
                                      _showcontent1("Result ", "Buy Fail");
                                    }
                                  }
                                },
                                child: LikeButton(
                                  size: 50,
                                  likeBuilder: (bool isLiked) {
                                    if(isOwnUser== true){
                                      return Icon(
                                          Icons.shopping_cart_outlined,
                                          color:  Colors.red,
                                          size :30
                                      );
                                    }
                                    else{
                                      if(isLiked) {

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
                              ),
                              Text("Buy",style: TextStyle(color: Colors.white),)
                            ],
                          ),

                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        margin: EdgeInsets.only(bottom: 15),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey[800].withOpacity(0.5),
                            ),
                            child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top :10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text("Cost", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Text(((){
                                          if(courseWithLessons.price==0){
                                            return "Free";}
                                          return courseWithLessons.price.toString() + " VND";
                                        })(),
                                          style: TextStyle(color: Colors.white),)



                                      ],
                                    ),
                                  ),
                                ])
                        )),
                    Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        margin: EdgeInsets.only(bottom: 15),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey[800].withOpacity(0.5),
                            ),
                            child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top :10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text("Requirement", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: courseWithLessons.requirement.length,
                                                  itemBuilder: (context,index){

                                                    return Text(courseWithLessons.requirement[index],
                                                      style: TextStyle(color: Colors.white),);
                                                  }),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ])
                        )),
                    Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        margin: EdgeInsets.only(bottom: 15),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey[800].withOpacity(0.5),
                            ),
                            child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top :10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text("Learn What", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: courseWithLessons.learnWhat.length,
                                                  itemBuilder: (context,index){

                                                return Text(courseWithLessons.learnWhat[index],
                                                  style: TextStyle(color: Colors.white),);
                                              }),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ])
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                        margin: EdgeInsets.only(bottom: 15),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey[800].withOpacity(0.5),
                            ),
                            child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top :10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text("Description", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Text(courseWithLessons.description,
                                          style: TextStyle(color: Colors.white),)



                                      ],
                                    ),
                                  ),
                                ])
                        )),
                    GestureDetector(

                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[800].withOpacity(0.5),
                        ),
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Lesson",
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),

                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                        child:DropDown(isOwnUser: isOwnUser,)
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        margin: EdgeInsets.only(bottom: 15),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey[800].withOpacity(0.5),
                            ),
                            child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top :10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text("Comment", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Builder(
                                            builder: (_){
                                              if(_isLoading){
                                                return Center(child: CircularProgressIndicator());
                                              }
                                              else{
                                                return Container(
                                                  child: ListView.builder(
                                                      scrollDirection: Axis.vertical,
                                                      shrinkWrap: true,
                                                      itemCount: comments.length != 0 ? comments.length : 0,
                                                      itemBuilder: (context,index){
                                                        return Padding(
                                                          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                                          child: ListTile(
                                                            leading: GestureDetector(
                                                              onTap: () async {
                                                                // Display the image in large form.
                                                                print("Comment Clicked");
                                                              },
                                                              child: Container(
                                                                height: 50.0,
                                                                width: 50.0,
                                                                decoration: new BoxDecoration(
                                                                    color: Colors.blue,
                                                                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                                                                child: CircleAvatar(
                                                                    radius: 50,
                                                                    backgroundImage: NetworkImage(comments[index].user.avatar)),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              comments[index].user.name,
                                                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                                            ),
                                                            subtitle: Text(comments[index].content,style: TextStyle(color: Colors.white),),
                                                          ),
                                                        );
                                                      }),
                                                );
                                              }

                                            }
                                            ),





                                      ],
                                    ),
                                  ),
                                ])
                        )),






                  ],
                ),
              );
            },
          )

    );
  }
}
