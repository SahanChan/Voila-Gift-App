import 'package:flutter/material.dart';

class ViolaHome extends StatefulWidget {
  @override
  _ViolaHomeState createState() => _ViolaHomeState();
}

class _ViolaHomeState extends State<ViolaHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Flowers',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 30.0,
              color: Colors.black,
            ),
            Row(
              children: <Widget>[
                Card(
                  child: Container(
                    child: Image.asset('images/flowes1.png'),
                    height: 150.0,
                    width: 150.0,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Card(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Cakes',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 30.0,
              color: Colors.black,
            ),
            Row(
              children: <Widget>[
                Card(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Card(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
