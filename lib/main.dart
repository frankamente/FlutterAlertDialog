import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Alert Dialog',
      home: DialogDemo(title: 'Demo Alert Dialog'),
    );
  }
}

class DialogDemo extends StatefulWidget {
  DialogDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  String currentText = "";
  void onChanged(value) {
    currentText = value;
  }

  void startAlertDialog() {
    setState(() {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(currentText),
              actions: [
                FlatButton(
                  child: Text("hola"),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                  child: Text("adios"),
                  onPressed: () => print("no"),
                ),
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: onChanged,
              decoration: InputDecoration(hintText: "Ingrese el texto"),
            ),
            RaisedButton(
              onPressed: startAlertDialog,
              child: Text("Ver Alerta"),
            )
          ],
        ),
      ),
    );
  }
}
