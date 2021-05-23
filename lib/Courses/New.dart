import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/api_courses.dart';
import 'package:flutter_app/model/courses/courses_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/IntroCourse.dart';
import 'package:flutter_app/Courses/Home.dart';
void main() {
  runApp(New());
}
class New extends StatelessWidget {
  String title ;
  List<Courses> courses;
  New({this.title,this.courses});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: NewPage(title: title,courses: courses,),
    );
  }
}

class NewPage extends StatefulWidget {
  String title;
  List<Courses> courses;
  NewPage({Key key, this.title,this.courses}) : super(key: key);
  @override
  _NewPageState createState() => _NewPageState(courses: courses);
}

class _NewPageState extends State<NewPage> {
  ApiProductService apiProductService = new ApiProductService();
  List<Courses> courses;
  bool _isLoading;
  _NewPageState({Key key,this.courses}) ;
  @override
  void initState() {
    _fetchNotes();


    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });



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
              Text(widget.title, textAlign: TextAlign.center,),
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
          if(_isLoading){
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: courses.length ,
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
                                      image: NetworkImage(courses[index].imageUrl)
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
                                      Flexible(child: Text(
                                        courses[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white
                                        ),
                                      ),),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                        child: Text(courses[index].instructorName,textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey
                                          ),),

                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                        child: Text(courses[index].price.toString(),textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey
                                          ),),

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



