// A. マテリアルコンポーネントをimportしてこのファイル内で利用可能にする
// https://flutter.dev/docs/development/ui/widgets/material
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

// D. StatelessWidgetを継承したクラス
class FirstPage extends StatelessWidget {
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
  // G. 状態の保持と更新
  int _counter = 0;
  Timer? _timer;
  double _start = 0;

  void startTimer() {
    final startDatetime = DateTime.now();

    const oneSec = const Duration(milliseconds: 10);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start >= 10) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start = DateTime.now().difference(startDatetime).inMilliseconds/1000;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('username')?? '');
    setState(() {
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter ++;
    });
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  int start_game_index = 0;


  // H. _MyHomePageStateのbuildメソッド
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
                  child: _start >= 10 || start_game_index == 0 ? Text(
                    '10.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50),
                  ): Text(
                    _start.toStringAsFixed(2).padLeft(5,'0'),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50),
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
                    child: _start >= 10 ? RaisedButton(
                      child:  Text(
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
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if((prefs.getInt('firstPage_$username')?? 0) < _counter){
                          prefs.setInt('firstPage_$username', _counter);
                        }
                        Navigator.of(context, rootNavigator: true).pop(context);
                      },
                    ): RaisedButton(
                      child:  Text(
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
                child: start_game_index == 0 ? Text(
                  'Press any button\nto start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),): Text(
                  '$_counter',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              child: _start >= 10 ? Text(
                "Time's up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ) : Column(
                children: [
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
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
                            onPressed: () {
                              start_game_index == 0 ? startTimer() : _incrementCounter();
                              start_game_index = 1;
                            },
                          ),
                        ),
                      ],
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