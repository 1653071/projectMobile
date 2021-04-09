import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/Home.dart';
void main() {
  runApp(IntroCourse());
}
class IntroCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: IntroCoursePage(),
    );
  }
}
class IntroCoursePage extends StatefulWidget {
  @override
  _IntroCoursePageState createState() => _IntroCoursePageState();
}

class _IntroCoursePageState extends State<IntroCoursePage> {
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
          body: Column(

            children: <Widget>[
             Center(child: Container(

                child :Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              )),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                child: Text("Build app with flutter" ,style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.left,),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                child:Container(
                    height: 30,
                    width: 150,

                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(


                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(

                      children: [

                        Container(
                          child :CircleAvatar(
                              radius:15,
                              backgroundImage: NetworkImage('https://via.placeholder.com/140x100')
                          ),
                        ),
                        TextButton(

                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () { },
                          child :Text('Jackson',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                      ],)
                ),

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
                        CircleAvatar(

                            radius: 20,
                            backgroundImage: NetworkImage('https://via.placeholder.com/140x100')
                        ),
                        Text("Subcribe",style: TextStyle(color: Colors.white),)
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


                        child :Text("Flutter là một SDK phát triển ứng dụng di động nguồn mở được tạo ra bởi Google. Nó được sử dụng để phát triển ứng ứng dụng cho Android và iOS, cũng là phương thức chính để tạo ứng dụng cho Google Fuchsia",
                          style: TextStyle(color: Colors.white),)
                    )
                ),

              )

            ],
          ),

    );
  }
}

