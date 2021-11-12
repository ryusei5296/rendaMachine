import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  @override
  SelectButtonState createState() => new SelectButtonState();
}

class SelectButtonState extends State<SelectButton> {

  @override
  Widget build(BuildContext context) {
    bool pressAttention = false;
    return Container(
      height: 70,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              height: 60,
              minWidth: 100,
              child: new RaisedButton(
                color: Colors.transparent,
                shape: Border.all(
                  color: pressAttention ? Colors.grey : Colors.blue,
                ),
                child: Text(
                  '10s',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onPressed: () => setState(() => pressAttention = !pressAttention),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ButtonTheme(
              height: 60,
              minWidth: 100,
              child: RaisedButton(
                color: Colors.transparent,
                shape: Border.all(
                  color: Colors.red,
                ),
                child: Text(
                  '60s',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onPressed: () {

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
                shape: Border.all(
                  color: Colors.red,
                ),
                child: Text(
                  'ENDLESS',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onPressed: () {

                },),
            ),
          ],
        ),),
    );
  }
}