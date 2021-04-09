import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/New.dart';
import 'package:flutter_app/Courses/IntroCourse.dart';
import 'package:flutter_app/Account/AccountHome.dart';
import 'package:flutter_app/Setting/MenuSetting.dart';
import 'package:flutter_app/Courses/Search.dart';
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
  'Account',
  'Settings',
  'SignOut'
];
class _HomePageState extends State<HomePage> {
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
            )
        ),
        body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:5,bottom:10,top: 10,right: 5),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                width: 180,

                child :Card(
                color:Colors.grey[800],

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:[

                   InkWell(
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => IntroCourse()),
                         );
                         },
                       child: Ink.image(
                           height: 100,
                           fit: BoxFit.cover,
                           image: NetworkImage(
                             "https://miro.medium.com/max/3540/1*Sk-iUeIOWpGmO53yq0A5Sw.jpeg",

                           )
                       )
                   ),

                      ListTile(


                        title: const Text('Building App with React and Flux',style: TextStyle(color: Colors.white),),
                        subtitle: Text(
                          'Secondary Text',
                          style: TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child :SmoothStarRating(
                          rating: 5,
                          size: 20,
                          starCount: 5,
                          color: Colors.yellow,
                        ),)

                    ]
                ),
              ),),
              Container(
                height: 200,
                width: 180,
                margin: EdgeInsets.only(left: 10),
                child :Card(
                  color:Colors.grey[800],
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[

                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                height: 100,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/1024/1*6l15igU_z2Uj15SzOGx1Iw.png",

                                )
                            )
                        ),

                        ListTile(


                          title: const Text('Data Science',style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                            'Secondary Text',
                            style: TextStyle(color: Colors.white.withOpacity(0.6)),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child :SmoothStarRating(
                            rating: 5,
                            size: 20,
                            starCount: 5,
                            color: Colors.yellow,
                          ),)

                      ]
                  ),
                ),),

            ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                width: 180,

                child :Card(
                  color:Colors.grey[800],

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[

                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                height: 100,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/3540/1*Sk-iUeIOWpGmO53yq0A5Sw.jpeg",

                                )
                            )
                        ),

                        ListTile(


                          title: const Text('Building App with React and Flux',style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                            'Secondary Text',
                            style: TextStyle(color: Colors.white.withOpacity(0.6)),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child :SmoothStarRating(
                            rating: 5,
                            size: 20,
                            starCount: 5,
                            color: Colors.yellow,
                          ),)

                      ]
                  ),
                ),),
              Container(
                height: 200,
                width: 180,
                margin: EdgeInsets.only(left: 10),
                child :Card(
                  color:Colors.grey[800],
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[

                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => IntroCourse()),
                              );
                            },
                            child: Ink.image(
                                height: 100,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://miro.medium.com/max/1024/1*6l15igU_z2Uj15SzOGx1Iw.png",

                                )
                            )
                        ),

                        ListTile(


                          title: const Text('Data Science',style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                            'Secondary Text',
                            style: TextStyle(color: Colors.white.withOpacity(0.6)),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child :SmoothStarRating(
                            rating: 5,
                            size: 20,
                            starCount: 5,
                            color: Colors.yellow,
                          ),)

                      ]
                  ),
                ),),

            ],
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
          SizedBox(
              width:MediaQuery.of(context).size.width*0.98,
            height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 10,right: 20),
            children: [
              Container(
                child :CircleAvatar(

                    radius: 50,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxP8wk42nI1BLQqh1CSeJUkK8woYc5TxB-vg&usqp=CAU')
                ),
              ),
              Container(
                child :CircleAvatar(

                    radius: 50,
                    backgroundImage: NetworkImage('https://pickaface.net/gallery/avatar/14154226_161019_0048_ykk23.png')
                ),
              ),
              Container(
                child :CircleAvatar(

                    radius: 50,
                    backgroundImage: NetworkImage('https://cdn1.vectorstock.com/i/1000x1000/52/20/beautiful-teacher-female-avatar-character-vector-18585220.jpg')
                ),
              ),
              Container(
                child :CircleAvatar(
                  backgroundImage: NetworkImage('https://pickaface.net/gallery/avatar/14154226_161019_0048_ykk23.png'),
                    radius: 50,
                ),
              ),




            ],
          ))
        ],
    ),
    );
  }
}


