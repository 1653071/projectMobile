import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/api_user.dart';
import 'package:flutter_app/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Courses/Home.dart';
void main() {
  runApp(AccountHome());
}
class AccountHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[800],
          )),
      home: AccountHomePage(),
    );
  }
}
class AccountHomePage extends StatefulWidget {
  @override
  _AccountHomePageState createState() => _AccountHomePageState();
}

class _AccountHomePageState extends State<AccountHomePage> {

  ApiService apiService = new ApiService();
  final nameController = TextEditingController();
  final avatarController= TextEditingController();
  final phoneController = TextEditingController();
  String name ="";
  String avatar="";
  String phone="";
  User user= new User();
  String token ;

  bool _isLoading =false;
  void _showcontent1(String msg,String msg1) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          backgroundColor: Colors.black,
          title: new Text(msg,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          content: new SingleChildScrollView(

            child: new Form(

              child: new ListBody(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Name" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                  ),
                  TextFormField(
                    controller:nameController,

                    validator: (value){
                      if(value.isEmpty){
                        return "Name is not empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        filled:true,
                        fillColor: Colors.grey,
                        labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                  ),
                  Container(

                    alignment: Alignment.centerLeft,
                    child: Text("Avatar" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                  ),
                  TextFormField(
                    controller:avatarController,

                    validator: (value){
                      if(value.isEmpty){
                        return "Avatar is not empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        filled:true,
                        fillColor: Colors.grey,
                        labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                  ),
                  Container(

                    alignment: Alignment.centerLeft,
                    child: Text("Phone" ,style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,),
                  ),
                  TextFormField(
                    controller:phoneController,

                    validator: (value){
                      if(value.isEmpty){
                        return "Phone is not empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        filled:true,
                        fillColor: Colors.grey,
                        labelStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Update'),
              onPressed: () async {
                user = await apiService.updateInfo(token,nameController.text,avatarController.text , phoneController.text);
                setState(() {

                  nameController.text= user.name;
                  avatarController.text= user.avatar;
                  phoneController.text = user.phone;
                });
                },
            ),
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
  @override
  void initState() {
    _fetchNotes();


    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    user = await apiService.getUserInfo(token);
    nameController.text= user.name;
    avatarController.text= user.avatar;
    phoneController.text = user.phone;

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
              InkWell(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
                child: Text("Home", textAlign: TextAlign.center,),),
              Text("Account", textAlign: TextAlign.center,),
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
      body: SingleChildScrollView(
        child: Builder(
          builder: (_){
            if(_isLoading ){
              return Center(child:CircularProgressIndicator());
            }
            return Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top:30),
                    child: CircleAvatar(

                        radius: 100,
                        backgroundImage: NetworkImage(user.avatar)
                    ),
                  ),
                ),

                Container(
                    padding: EdgeInsets.only(top:15),
                    child:Center(

                        child:Text(user.name,style: TextStyle(color: Colors.white,fontSize: 30),)
                    )
                ),
                SizedBox(height: 40,),

                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(color: Colors.white,fontSize: 20)
                      ,)
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      user.name,
                      style: TextStyle(color: Colors.grey,fontSize: 16)
                      ,)
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Phone",
                      style: TextStyle(color: Colors.white,fontSize: 20)
                      ,)
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      user.phone,
                      style: TextStyle(color: Colors.grey,fontSize: 16)
                      ,)
                ),
                InkWell(
                  onTap: (){
                    _showcontent1("d", "df");
                  },
                  child: Container(
                    padding:  EdgeInsets.only(top:10,left:20,right:20),
                    height: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      shadowColor: Colors.blue,
                      color: Colors.blue,
                      elevation: 7.0,
                      child : Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
                Container(
                  padding:  EdgeInsets.only(top:10,left:20,right:20),
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    shadowColor: Colors.blue,
                    color: Colors.blue,
                    elevation: 7.0,
                    child : Center(
                      child: Text(
                        'Sign out',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),

                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

