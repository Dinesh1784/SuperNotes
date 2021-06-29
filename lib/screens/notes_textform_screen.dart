import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:super_notes/models/notes.dart';

class NotesForm extends StatefulWidget {
  const NotesForm({Key key, this.title, this.buttonText}) : super(key: key);
  final String title;
  final String buttonText;

  @override
  _NotesFormState createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void addNotes(Notes notes) {
    if (_titleController.text.isEmpty && _descriptionController.text.isEmpty) {
      return;
    }
    final notesBox = Hive.box('notes');
    notesBox.add(notes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: "Title",
                    ),
                    cursorColor: Colors.yellow[900],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: _descriptionController,
                    cursorColor: Colors.yellow[900],
                    decoration: InputDecoration(
                      labelText: "Description",
                    ),
                    maxLength: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow[900]),
                    ),
                    onPressed: () {
                      final notes = Notes(
                          title: _titleController.text,
                          description: _descriptionController.text);
                      addNotes(notes);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(CupertinoIcons.upload_circle),
                    label: Text(widget.buttonText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
