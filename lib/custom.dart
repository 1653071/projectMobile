import 'package:flutter/material.dart';

import 'package:flutter_app/model/ExpandedListAnimationWidget.dart';

class DropDown extends StatefulWidget {
  bool isOwnUser;
  DropDown({this.isOwnUser});
  @override
  _DropDownState createState() => _DropDownState(isOwnUser: isOwnUser);
}
List <String> _list =['Dog',"Cat","Mouse",'Lion'];
class _DropDownState extends State<DropDown> {
  bool isOwnUser;
  bool isStrechedDropDown = false;
  int groupValue;
  String title = 'Select Animals';
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
  _DropDownState({this.isOwnUser});
  @override
  Widget build(BuildContext context) {
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
                              color: Colors.grey[800].withOpacity(0.5),

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
                                            title,style: TextStyle(color: Colors.white),
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
                                              itemCount: _list.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(bottom: 30),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "1",
                                                        style: TextStyle(
                                                          fontSize: 28,
                                                          color: Colors.green,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: "mins",
                                                              style: TextStyle(
                                                                color: Color(0xFF0D1333).withOpacity(.5),
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
                                                      Container(
                                                        margin: EdgeInsets.only(left: 20),
                                                        height: 40,
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.green,
                                                        ),
                                                        child: Icon(Icons.play_arrow, color: Colors.white),
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
  }
}