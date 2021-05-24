

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Courses/WidgetComponent.dart';
import 'package:flutter_app/api/api_courses.dart';
import 'package:flutter_app/api/api_teacher.dart';
import 'package:flutter_app/model/search/search_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/search/search_model.dart';

import 'Home.dart';

void main() {
  runApp(Search());
}
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var dataController = TextEditingController();
  ApiProductService apiProductService= new ApiProductService();
  List<SearchData> list ;
  List<TeacherData> teachers;
  ApiTeacher apiTeacher= new ApiTeacher();
  bool isActive;
  bool isActive1;
  bool isActivate2 ;
  bool _isLoading;
  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });
    isActive=false;
    isActive1=false;
    isActivate2 = true;
    String data= dataController.text;
    list = await apiProductService.fetchCourseSearch(data);
    teachers= await apiTeacher.fetchTeacherSearch(data);

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
          Text("Search", textAlign: TextAlign.center,),
          InkWell(onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
            child: Text("Back", textAlign: TextAlign.center,),),
        ],
      ),
      ),
        body:SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.75,
                        child:TextField(
                          controller: dataController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              icon: IconButton(
                                icon:Icon(Icons.search),
                                color: Colors.white,
                                onPressed: () {
                                  _fetchNotes();

                                },
                              ),
                              hintText: "Search Here",
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.25,
                        child: TextButton(
                            onPressed: () {

                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),

                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("History",style: TextStyle(color: Colors.white,fontSize: 16),),

                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20,top: 10),
                      child :Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(

                              onTap: (){
                                if(isActivate2==false){
                                  setState(() {
                                    isActivate2==true;
                                    isActive1=false;
                                    isActive= false;
                                  });
                                }

                              },
                              child: Container(

                                height: 30,

                                decoration: BoxDecoration(
                                  color: isActivate2 ? Colors.grey[900]:Colors.grey[800],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text("All",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              )
                          ),
                          InkWell(

                              onTap: (){
                                  if(isActive==false){
                                    setState(() {
                                      isActive=true;
                                      isActive1=false;
                                      isActivate2=false;
                                    });
                                  }

                              },
                              child: Container(

                                height: 30,

                                decoration: BoxDecoration(
                                  color: isActive ? Colors.grey[900]:Colors.grey[800],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text("Course",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              )
                          ),
                          InkWell(
                              onTap: (){
                                if(isActive1==false){
                                  setState(() {
                                    isActive1=true;
                                    isActive=false;
                                    isActivate2=false;
                                  });
                                }

                              },
                              child: Container(

                                height: 30,
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: isActive1 ? Colors.grey[900]:Colors.grey[800],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text("Instructor",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              )
                          ),

                        ],
                      )
                  ),
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey[800].withOpacity(0.5),
                    ),
                    child: Builder(
                      builder: (_){
                        if (_isLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if(list.length ==null){
                          return Center(child: Text("Not Found",style: TextStyle(color: Colors.white),));
                        }
                        if(isActive==true){
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context,index){
                                return InkWell(
                                  child: CourseSearch(image:list[index].imageUrl,title: list[index].title,name: list[index].name,
                                    price: list[index].price,id: list[index].id,),
                                );
                              });
                        }
                        else if(isActive1){
                          if(teachers.length==0){

                            return Center(child: Text("Not Found",style: TextStyle(color: Colors.white),));

                          }
                          else{
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: teachers.length !=0 ? teachers.length : 0,
                                itemBuilder: (context,index){
                                  return InkWell(
                                    child: TeacherSearch(avatar: teachers[index].avatar,name: teachers[index].name,num: teachers[index].numcourses,),
                                  );
                                });
                          }
                        }
                        else{
                          return Column(
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: teachers.length !=0 ? teachers.length:0,
                                  itemBuilder: (context,index){
                                    return InkWell(
                                        child: TeacherSearch(avatar: teachers[index].avatar,name: teachers[index].name,num: teachers[index].numcourses,)
                                    );
                                  }),
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: list.length !=0? list.length:0,
                                  itemBuilder: (context,index){
                                    return InkWell(
                                        child: CourseSearch(image:list[index].imageUrl,title: list[index].title,name: list[index].name,
                                          price: list[index].price,id: list[index].id)
                                    );
                                  }),
                            ],
                          ) ;
                        }
                      },
                    ),
                  )
                ],
              )
        )
    );
  }
}

