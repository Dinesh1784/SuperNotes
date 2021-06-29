import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_notes/screens/notes_textform_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key, this.descritpion, this.title}) : super(key: key);
  final String title;
  final String descritpion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            descritpion,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
