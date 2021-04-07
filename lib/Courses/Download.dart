import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(Download());
}
class Download extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey,
          )),
      home: DownloadPage(),
    );
  }
}
class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
        child: Text("React", textAlign: TextAlign.center,)),


    ),
    body: Center(
      child : Column(
      children: <Widget>[

      Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("New",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
          Container(
            height: 30,
            width: 80,

            decoration: BoxDecoration(

              backgroundBlendMode: BlendMode.softLight,
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextButton(

              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () { },
              child: Center(child :Text('See all',style: TextStyle(color: Colors.white,fontSize: 14),)),
            ),
          ),

        ],
      ),
        Container(height:300,width: 500.0,child:ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Card(
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
                              image: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png")
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
                                "sdasd",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                child: Text("CopyHouse",textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey
                                  ),),

                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                child: Text("CopyHouse",textAlign: TextAlign.center,
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
            Card(
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
                              image: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png")
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
                                "sdasd",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                child: Text("CopyHouse",textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey
                                  ),),

                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                child: Text("CopyHouse",textAlign: TextAlign.center,
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


          ],
        )
    ),
      ],
    )
    )
    );
  }
}

