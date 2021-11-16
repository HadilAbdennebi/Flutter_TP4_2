import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String documentsPath = '';
  String tempPath = '';
  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState() {
    getPaths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Path Provider')),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Doc path: ' + documentsPath,
                    style: TextStyle(fontSize: 10.0)),
                Text('Temp path' + tempPath, style: TextStyle(fontSize: 10.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
