import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:super_notes/models/notes.dart';
import 'package:super_notes/screens/detailscreen.dart';
import 'package:super_notes/screens/notes_textform_screen.dart';

import 'package:super_notes/widget/single_note.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Notes",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      body: WatchBoxBuilder(
          box: Hive.box('notes'),
          builder: (context, notesBox) {
            return ListView.builder(
              itemCount: notesBox.length,
              itemBuilder: (context, index) {
                final notes = notesBox.getAt(index) as Notes;
                return Dismissible(
                  key: Key(notes.title),
                  background: slideLeftBackground(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (DismissDirection direction) {
                    notesBox.deleteAt(index);
                  },
                  child: SingleNote(
                    title: notes.title,
                    description: notes.description,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                            title: notes.title,
                            descritpion: notes.description,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[900],
        child: Icon(CupertinoIcons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (ctx) => NotesForm(
                title: "Add Notes",
                buttonText: "Add",
              ),
            ),
          );
        },
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
