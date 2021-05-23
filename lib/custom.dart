import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/Lesson.dart';

import 'package:flutter_app/model/ExpandedListAnimationWidget.dart';
import 'package:flutter_app/model/courses/course_withlesson.dart';

class DropDown extends StatefulWidget {
  bool isOwnUser;
  CourseWithLessons list;
  DropDown({this.isOwnUser,this.list});
  @override
  _DropDownState createState() => _DropDownState(isOwnUser: isOwnUser,list:list);
}
List <String> _list =['Dog',"Cat","Mouse",'Lion'];
class _DropDownState extends State<DropDown> {
  bool isOwnUser;
  CourseWithLessons list;
  bool isStrechedDropDown = false;
  int groupValue;

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
  _DropDownState({this.isOwnUser,this.list});
  @override
  Widget build(BuildContext context) {
    return Builder(

        builder: (_){
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: list.section.length,
                itemBuilder: (context,index){
                  return Container(

                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800].withOpacity(0.2),

                                    ),

                                    child: Column(
                                      children: [
                                        Container(
                                          // height: 45,
                                            width: double.infinity,
                                            padding: EdgeInsets.only(right: 10),

                                            constraints: BoxConstraints(
                                              minHeight: 45,
                                              minWidth: double.infinity,
                                            ),
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 20, vertical: 10),
                                                    child: Text(
                                                      list.section[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if(isOwnUser ==true){
                                                          isStrechedDropDown =
                                                          !isStrechedDropDown;
                                                        }
                                                        else{
                                                          _showcontent1("Permission denided", "Please buy course to learn lesson");
                                                        }
                                                      });
                                                    },
                                                    child: Icon(isStrechedDropDown
                                                        ? Icons.arrow_upward
                                                        : Icons.arrow_downward))

                                              ],
                                            )),
                                        ExpandedSection(
                                          expand: isStrechedDropDown,

                                          child: Builder(
                                              builder: (context) {
                                                return ListView.builder(
                                                    padding: EdgeInsets.all(0),

                                                    shrinkWrap: true,
                                                    itemCount: list.section[index].lesson.length != 0 ? list.section[index].lesson.length: 0,
                                                    itemBuilder: (context, index1) {
                                                      return Container(

                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[800].withOpacity(0.5),
                                                            border: Border(
                                                              bottom: BorderSide( //                   <--- left side
                                                                color: Colors.white,
                                                                width: 1.0,
                                                              ),

                                                            )
                                                        ),
                                                        padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              width: 150,
                                                              child: Text(
                                                                list.section[index].lesson[index1].name,
                                                                style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 20),
                                                            RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: list.section[index].lesson[index1].hours.toString(),
                                                                    style: TextStyle(
                                                                      color:Colors.white,
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
                                                            InkWell(
                                                              onTap: (){
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(builder: (context) => VideoScreen(courseId: list.id,lessonId: list.section[index].lesson[index1].id,)),
                                                                );

                                                              },
                                                              child: Container(
                                                                margin: EdgeInsets.only(left: 20),
                                                                height: 30,
                                                                width: 30,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Colors.red,
                                                                ),
                                                                child: Icon(Icons.play_arrow, color: Colors.white),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    });}
                                          ),),



                                      ],
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          );
        });
  }
}