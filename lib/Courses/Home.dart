import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Authentication/ChangePassword.dart';
import 'package:flutter_app/Authentication/SignIn.dart';
import 'package:flutter_app/Courses/Favorite.dart';
import 'package:flutter_app/api/api_login.dart';
import 'package:flutter_app/model/courses/course_withlesson.dart';
import 'package:flutter_app/model/user/user_model.dart';
import 'package:flutter_app/share_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/New.dart';
import 'package:flutter_app/Courses/IntroCourse.dart';
import 'package:flutter_app/Account/AccountHome.dart';
import 'package:flutter_app/Setting/MenuSetting.dart';
import 'package:flutter_app/Courses/Search.dart';
import 'package:flutter_app/api/api_courses.dart';
import 'package:flutter_app/model/courses/courses_model.dart';
import 'package:flutter_app/model/teacher/teacher_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/api/api_teacher.dart';
import 'package:flutter_app/api/api_category.dart';
import 'package:flutter_app/model/category/category.dart';

void main() {
  runApp(Home());
}
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: HomePage(),

    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
List<String> choices = <String>[
  'Information',
  'Favorite',
  'Settings',
  'ChangePassword',
  'SignOut'
];
class _HomePageState extends State<HomePage> {
  ApiProductService apiProductService= new ApiProductService();
 ApiTeacher apiTeacher= new ApiTeacher();
 ApiCategoryService apiCategoryService = new ApiCategoryService();
 ApiService apiService = new ApiService();
  List<Courses> courses;
  List<Courses> coursesTrending;
  List<Teacher> teachers;
  List<Category> categories;

  User user;
  String token ;

    bool _isLoading =false;
  @override
  void initState() {
    _fetchNotes();


    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });
    teachers = await apiTeacher.fetchTeacher();
    courses = await apiProductService.fetchCourses();
    coursesTrending=await apiProductService.fetchTrendingCourses();
    categories = await apiCategoryService.fetchCategory();

    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    user = await apiService.getUserInfo(token);
    print(user.id);
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
                IconButton(
                  icon: const Icon(Icons.search),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                      );
                    }
                ),
                Text("Home", textAlign: TextAlign.center,),
                Container(
                  child :Row(
                    children: [
                      Builder(
                          builder:(_){
                            if(_isLoading){
                              return Center(child: CircularProgressIndicator());
                            }
                            else{
                              return CircleAvatar(
                                  radius: 18,
                                  backgroundImage: NetworkImage(user.avatar)
                              );
                            }
                          }
                          ),
                      PopupMenuButton<String>(
                        color: Colors.grey[800],
                        onSelected: (String newValue) {
                          setState(() {
                            if (newValue == 'Account'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AccountHome()),
                              );
                            }
                            else if(newValue =='Settings'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MenuSetting()),
                              );
                            }
                            else if(newValue =='Favorite'){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Favorite()),
                              );
                            }
                            else if (newValue == 'SignOut')
                            {
                              SharedService.logout();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignIn()),
                              );
                            }else if (newValue == 'ChangePassword')
                            {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChangePassword(id: user.id,)),
                              );
                            }

                          });
                        },
                        itemBuilder: (BuildContext context){
                          return choices.map((String choice){
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),

                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Builder(
                  builder: (_) {
                    if (_isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container(
                        height: 30,
                       child: Padding(
                         padding: const EdgeInsets.only(left: 10.0),
                         child:ListView.builder(

                             scrollDirection: Axis.horizontal,
                             shrinkWrap: true,
                             itemCount: categories.length,
                             itemBuilder: (context,index){
                               return  InkWell(
                                 onTap: (){

                                 },
                                 child: Container(

                                   height: 20,
                                   margin: EdgeInsets.only(left: 10),
                                   decoration: BoxDecoration(
                                     color: Colors.grey[800],
                                     borderRadius: BorderRadius.circular(20.0),
                                   ),
                                   child: Center(
                                     child: Padding(
                                       padding: EdgeInsets.symmetric(
                                           horizontal: 22.0, vertical: 6.0),
                                       child: Text(categories[index].name,
                                           style: TextStyle(color: Colors.white)),
                                     ),
                                   ),
                                 )
                               );
                             }),
                       )

                    );
                  }
              ),
              
              Container(
                padding: EdgeInsets.only(left:10,bottom:10,top: 10,right: 10),
                child :Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("New",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                    Container(
                        width: 80,
                        height: 30,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => New()),
                              );
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),

                                    )
                                )
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("See all",style: TextStyle(color: Colors.white,fontSize: 12),),
                                Icon(Icons.double_arrow_outlined,size: 10,color: Colors.white,)
                              ],
                            ))
                    )

                  ],
                ),

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
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              String id = courses[index].id;
                              String idI = courses[index].instructorId;
                              return GestureDetector(
                                onTap: (){

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => IntroCourse(id: id,idInstructor: idI)),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
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
                                                    courses[index].imageUrl,

                                                  )
                                              )
                                          ),

                                          ListTile(

                                            title: Text(courses[index].title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),

                                            subtitle: Text(
                                              courses[index].subtitle,
                                              style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            alignment: Alignment.bottomLeft,
                                            child :SmoothStarRating(
                                              rating: courses[index].ratedNumber,
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
              Container(

                padding: EdgeInsets.only(left:5,top :10,bottom: 10,right: 5),
                child :Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Trending",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                    Container(
                        width: 80,
                        height: 30,
                        child: TextButton(

                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),

                                    )
                                )
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("See all",style: TextStyle(color: Colors.white,fontSize: 12),),
                                Icon(Icons.double_arrow_outlined,size: 10,color: Colors.white,)
                              ],
                            ))
                    )


                  ],
                ),

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
                            itemCount: coursesTrending.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => IntroCourse(id: coursesTrending[index].id,idInstructor: coursesTrending[index].instructorId)),
                                    );
                                  },
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
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
                                          InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => IntroCourse(id: coursesTrending[index].id,idInstructor: coursesTrending[index].instructorId,)),
                                                );
                                              },
                                              child: Ink.image(
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    coursesTrending[index].imageUrl,

                                                  )
                                              )
                                          ),

                                          ListTile(

                                            title: Text(coursesTrending[index].title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),

                                            subtitle: Text(
                                              coursesTrending[index].subtitle,
                                              style: TextStyle(color: Colors.white.withOpacity(0.6)),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            alignment: Alignment.bottomLeft,
                                            child :SmoothStarRating(
                                              rating: coursesTrending[index].ratedNumber,
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
              Container(

                padding: EdgeInsets.only(left:5,top :10,right: 5),
                child :Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Teacher",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                    Container(
                      height: 30,
                      width: 80,

                      decoration: BoxDecoration(

                        backgroundBlendMode: BlendMode.softLight,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                    ),


                  ],
                ),

              ),
              Builder(builder: (_) {
                  if (_isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount:teachers.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index){
                        return Container(
                          margin: EdgeInsets.only(left: 10),
                          child :CircleAvatar(

                              radius: 50,
                              backgroundImage: NetworkImage(teachers[index].useravatar)
                          ),
                        );
                      },),
                  );
              }),

            ],
          ),
        )
    );
  }
}


