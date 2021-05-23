import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/api_payment.dart';
import 'package:flutter_app/custom.dart';
import 'package:flutter_app/model/comment/comment_model.dart';
import 'package:http/http.dart' as http;
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
import 'package:comment_box/comment/comment.dart';
import 'package:flutter_app/model/courses/course_detail.dart';
import 'package:flutter_app/api/api_teacher.dart';
import 'package:comment_box/comment/comment.dart';
import 'dart:convert';
void main() {
  runApp(IntroCourse(id:"445c1106-7dd5-4e6d-bbad-9a52dd7137c8",idInstructor: "e79caee9-0afb-4baa-b23d-d63f63dde80d",));
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
   double rating= 0;
   final commentController = TextEditingController();
   TeacherDetail teacherDetail ;
   CourseWithLessons courseWithLessons;
   StatusFavorite coursesFavorite;
   bool isOwnUser;
   bool isLiked;
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
                 setState(() {

                 });
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
     print(id);
     SharedPreferences pref = await SharedPreferences.getInstance();
     token = pref.getString("token");
     courseWithLessons = await apiProductService.fetchCourseDetail(id);
     coursesFavorite = await apiProductService.StatusFavoriteCourse(id, token);
     teacherDetail = await apiTeacher.fetchTeacherBaseOnCourse(idInstructor);
     comments = await apiProductService.fetchCommentofCourse(id);
     pf= await apiPayment.CheckOwnCourse1(token, id);

     setState(() {
       if(pf.isUserOwnCourse==true){
         isOwnUser= true;
         isLiked = true;
       }
       else{
         isOwnUser= false;
         isLiked=false;
       }
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
                              Container(
                                color: Colors.black,
                                  child:RaisedButton(
                                  color: Colors.black,
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: isLiked ? Colors.red:Colors.white,
                                    ),
                                    onPressed: (){
                                      if(isOwnUser== true){
                                        _showcontent1("Result", "You have already buy/subcrise course");

                                      }
                                      else{
                                        setState(() {
                                          ApiPayment.FreeCourse(token, id);
                                          _fetchNotes();
                                        });

                                      }
                                    },







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
                                          child: Text("Lesson", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        DropDown(isOwnUser: isOwnUser,list: courseWithLessons,)



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
                                          padding: EdgeInsets.only(left:10,bottom: 10),
                                          child: Text("Comment", style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Container(
                                          child: Builder(
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
                                        ),
                                        Container(
                                          color: Colors.grey[800],
                                          child: Column(
                                            children: [
                                              Container(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Container(

                                                    padding: EdgeInsets.only(left: 10,top: 10),

                                                    child :SmoothStarRating(
                                                      filledIconData: Icons.star,
                                                      allowHalfRating: false,
                                                      rating: rating,
                                                      size: 20,
                                                      starCount: 5,
                                                      isReadOnly: false,
                                                      borderColor: Colors.white,
                                                      color: Colors.yellow,
                                                      onRated: (value) {
                                                        setState(() {
                                                          rating = value;
                                                        });
                                                        // print("rating value dd -> ${value.truncate()}");
                                                      },
                                                    ),)
                                              ),




                                              Container(
                                                child: TextField(
                                                  controller:commentController ,
                                                  style: TextStyle(color: Colors.white),
                                                  decoration: InputDecoration(

                                                    hintText: "Comment Here"
                                                    ,
                                                    hintStyle: TextStyle(color: Colors.white),
                                                    icon: IconButton(
                                                      icon:Icon(Icons.subdirectory_arrow_right_outlined),
                                                      color: Colors.white,
                                                      onPressed: () async {
                                                        String a = rating.toString();
                                                        String content = commentController.text;
                                                        String url = "https://api.letstudy.org/course/rating-course";
                                                        final http.Response response = await http.post(Uri.parse(url), headers: {

                                                          'Authorization': 'Bearer $token',
                                                        }, body: {'courseId': id,
                                                          'formalityPoint': a,
                                                          'contentPoint': a,
                                                          'presentationPoint': a,
                                                          "content": content
                                                        });
                                                        if(response.statusCode==200){

                                                          _fetchNotes();

                                                        }

                                                      },
                                                    ),),
                                                ),
                                              )
                                            ],
                                          )
                                        ),





                                      ],
                                    ),
                                  ),
                                ])
                        )
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left:10,bottom:10,top: 10,right: 10),
                      child:Text("Course on the same topic",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                    ),
                    Builder(
                        builder: (_) {
                          if (_isLoading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Container(
                              height: 300,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: courseWithLessons.coursesLikeCategory.length,
                                  itemBuilder: (context, index) {
                                    String id = courseWithLessons.coursesLikeCategory[index].id;
                                    String idI = courseWithLessons.coursesLikeCategory[index].instructorId;
                                    return GestureDetector(
                                        onTap: (){

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => IntroCourse(id: id,idInstructor: idI)),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[800],

                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white.withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],

                                          ),
                                          child :Card(
                                            color:Colors.grey[800],
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children:[
                                                  InkWell(onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => IntroCourse(id: id,idInstructor: idI)));
                                                  },
                                                      child: Ink.image(
                                                          height: 150,
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            courseWithLessons.coursesLikeCategory[index].imageUrl,

                                                          )
                                                      )
                                                  ),

                                                  ListTile(

                                                    title: Text(courseWithLessons.coursesLikeCategory[index].title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),

                                                    subtitle: Text(
                                                      courseWithLessons.coursesLikeCategory[index].subtitle,
                                                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(left: 10),
                                                    alignment: Alignment.bottomLeft,
                                                    child :SmoothStarRating(
                                                      rating: courseWithLessons.coursesLikeCategory[index].ratedNumber,
                                                      size: 20,
                                                      starCount: 5,
                                                      isReadOnly: true,
                                                      color: Colors.yellow,
                                                    ),)

                                                ]
                                            ),
                                          ),
                                        )
                                    );
                                  }
                              )
                          );
                        }
                    ),






                  ],
                ),
              );
            },
          )

    );
  }
}
