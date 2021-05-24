import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_courses.dart';
import 'package:flutter_app/model/video/videoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:dio/dio.dart';
void main() {
  runApp(Home());
}
class Home extends StatelessWidget {
  String videoId = YoutubePlayer.convertUrlToId("https://youtube.com/embed/38CVXLCXqtE");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),



    );
  }
}
class VideoScreen extends StatefulWidget {
  final String courseId;
  final String lessonId;


  VideoScreen({this.courseId,this.lessonId});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  YoutubePlayerController _controller;
  ApiProductService apiProductService = new ApiProductService();
  VideoModel video ;
  VideoUrl url;
  String videoId ;
  String token;
  bool isloading ;
  var imgUrl ;
  bool downloading = false;
  var progressString = "";
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
            new FlatButton(onPressed: (){
              int a = url.currentTime.toInt();
              String b = a.toString();
              setState(() {
                _controller = YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(url.videoUrl.toString()),
                  flags: YoutubePlayerFlags(
                      mute: false,
                      autoPlay: true,
                      startAt: a
                  ),
                );
              });
              Navigator.of(context).pop();
            }, child: new Text("Ok")),

            new FlatButton(
              child: new Text('Cancle'),
              onPressed: () {
                setState(() {
                  _controller = YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(url.videoUrl.toString()),
                    flags: YoutubePlayerFlags(

                        mute: false,
                        autoPlay: true,
                        startAt: 0
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    _fetchNotes();

    super.initState();

  }
  _fetchNotes() async {
    setState(() {
      isloading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    video = await apiProductService.fetchVideo(token, widget.courseId, widget.lessonId);
    url= await apiProductService.fetchVideoUrl(token, widget.courseId, widget.lessonId);
    print(url.videoUrl);
    videoId = YoutubePlayer.convertUrlToId(url.videoUrl);
    int b = url.currentTime.toInt();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url.videoUrl.toString()),
      flags: YoutubePlayerFlags(

          mute: false,
          autoPlay: true,
          startAt: b
      ),
    );




    setState(() {
      isloading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Builder(
        builder: (_){
          if(isloading){
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  print('Player is ready.');
                },
              ),
              Container(
                alignment: Alignment.topLeft,

                child:Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  padding: EdgeInsets.only(left:10,bottom:10,top: 10,right: 10),
                  child:Text(video.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                ),),
              Container(
                alignment: Alignment.topRight,
                child: Container(
                  height: 60,
                  width: 120,

                  padding: EdgeInsets.only(left:10,bottom:10,top: 10,right: 10),
                  child:TextButton(
                      onPressed: () async {
                        imgUrl= url.videoUrl;
                        Dio dio = Dio();

                        try {
                          var dir = await getApplicationDocumentsDirectory();
                          print("path ${dir.path}");
                          await dio.download(imgUrl, "${dir.path}/demo.mp4",
                              onReceiveProgress: (rec, total) {
                                print("Rec: $rec , Total: $total");

                                setState(() {
                                  downloading = true;
                                  progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
                                });
                              });
                        } catch (e) {
                          print(e);
                        }

                        setState(() {
                          downloading = false;
                          progressString = "Completed";
                        });
                        print("Download completed");


                        // Get the video manifest.

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),

                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Download",style: TextStyle(color: Colors.white,fontSize: 16),),

                        ],
                      )),
                ),)
            ],
          );
        },
      )
    );
  }
}
