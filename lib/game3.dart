// A. マテリアルコンポーネントをimportしてこのファイル内で利用可能にする
// https://flutter.dev/docs/development/ui/widgets/material
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

// D. StatelessWidgetを継承したクラス
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // N-1. Theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// E. StatefulWidgetを継承したクラス
class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

// F. Stateを継承したクラス
class _MyHomePageState extends State<MyHomePage> {
  String username = '';
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username')?? '');
      _counter = (prefs.getInt('thirdPage_$username') ?? 0);
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter ++;
    });
    prefs.setInt('thirdPage_$username', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/lufy.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Text(
                    "NO LIMIT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 60,
                    width: 160,
                    child: RaisedButton(
                      child: Text(
                        'QUIT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35
                        ),
                      ),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: Center(
                  child: Text(
                      '$_counter',
                      style: TextStyle(color: Colors.white, fontSize: 40)
                  ),),
            ),
            SizedBox(
              height: 10,
            ),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 85,
                    height: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(100),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red)),
                      onPressed: _incrementCounter,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}