// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'game2.dart';
import 'game3.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage>{
  String username = '';
  int selectionIndex = 0;
  int _first = 0;
  int _second = 0;
  int _third = 0;
  final pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  @override
  void initState() {
    super.initState();
    loadUsername();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _first = (prefs.getInt('firstPage_$username')?? 0);
      _second = (prefs.getInt('secondPage_$username')?? 0);
      _third = (prefs.getInt('thirdPage_$username')?? 0);
    });
  }

  loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('username')?? '');
    textEditingController.text = username;
  }

  void _handleText(String e) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = e;
      prefs.setString('username', '$username');
      _loadCounter();
    });
  }

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/black.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget> [
                            Expanded(
                              child: Text(
                                '10s',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellowAccent,
                                ),),
                            ),
                            Expanded(
                              child: Text(
                                '60s',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellowAccent,
                                ),),
                            ),
                            Expanded(
                              child: Text(
                                'ENDLESS',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellowAccent,
                                ),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget> [
                            Expanded(
                              child: Text(
                                '$_first',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                            ),
                            Expanded(
                              child: Text(
                                '$_second',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                            ),
                            Expanded(
                              child: Text(
                                '$_third',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Renda',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Machine',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    height: 40,
                    width: 230,
                    child: TextField(
                      controller: textEditingController,
                      decoration: new InputDecoration.collapsed(
                        hintText: 'Input your name',
                        hintStyle: TextStyle(fontSize: 25),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      onChanged: _handleText,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  username == '' ? Container(
                    height: 138,
                  ) :
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              height: 60,
                              minWidth: 100,
                              child: RaisedButton(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: selectionIndex == 0 ? Colors.red : Colors.white,)),
                                child: Text(
                                  '10s',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                onPressed: () {
                                  setState(() {});
                                  selectionIndex = 0;
                                },),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ButtonTheme(
                              height: 60,
                              minWidth: 100,
                              child: RaisedButton(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: selectionIndex == 1 ? Colors.red : Colors.white,)),
                                child: Text(
                                  '60s',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                onPressed: () {
                                  setState(() {});
                                  selectionIndex = 1;
                                },),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ButtonTheme(
                              height: 60,
                              minWidth: 100,
                              child: RaisedButton(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: selectionIndex == 2 ? Colors.red : Colors.white,)),
                                child: Text(
                                  'ENDLESS',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                onPressed: () {
                                  setState(() {});
                                  selectionIndex = 2;
                                },),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonTheme(
                          minWidth: 340,
                          height: 60,
                          child: RaisedButton(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () async {
                              var _start = await Navigator.push(
                                context, MaterialPageRoute(builder: (context) {return pages[selectionIndex];}),
                              );
                              _loadCounter();
                            },
                            child: const Text('Play',style: TextStyle(color: Colors.white,fontSize: 35,),),

                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 160,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                ' FONT:\n Isurus Labs\n Grand Chaos Productions\n\n'
                                    ' ICON:\n Yukichi\n\n'
                                    ' SPECIAL THANKS:\n Yukichi,@real_onesc\n\n'
                                    ' [c]2018 sinProject inc.\n',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

