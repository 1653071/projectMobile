import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/SignIn.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: MyHomePage(title: 'Flutter Demo ome Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PLURALSIGHT'
              ,
              style: TextStyle(
                color : Colors.white,
              ),
            ),
            Container(

              width: 300,
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(5),
                shadowColor: Colors.blue,
                color: Colors.blue,
                elevation: 7.0,
                child : Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child:Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      ),),
                  ),
                ),

              ),
            ),
            Container(
              width: 300,
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(color:Colors.blue,width: 2),
                  borderRadius: BorderRadius.circular(5),
              ),

              margin: EdgeInsets.only(top: 15),
              child: Material(


                shadowColor: Colors.black,
                color: Colors.black,
                elevation: 7.0,
                child : Center(
                  child: Text(
                    'Explode without a subcription',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),

              ),
            ),
            Container(
              width: 300,
              height: 40.0,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.blue,width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.only(top: 15),
              child: Material(

                shadowColor: Colors.black,
                color: Colors.black,
                elevation: 7.0,
                child : Center(
                  child: Text(
                    'Subscribe to PluralSight',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
