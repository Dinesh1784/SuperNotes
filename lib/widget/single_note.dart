import 'package:flutter/material.dart';

class SingleNote extends StatelessWidget {
  SingleNote({
    Key key,
    @required this.title,
    @required this.description,
    @required this.onPressed,
  }) : super(key: key);
  final String title;
  final String description;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          border: Border.all(color: Colors.yellow[600], width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              description,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
