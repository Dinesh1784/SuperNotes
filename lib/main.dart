import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:super_notes/models/notes.dart';
import 'package:super_notes/screens/mainscreen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(NotesAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.yellow[900]),
        ),
      ),
      home: FutureBuilder(
        future: Hive.openBox('notes'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) if (snapshot
              .hasError)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          else
            return MainScreen();
          else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('notes').close();
    super.dispose();
  }
}
