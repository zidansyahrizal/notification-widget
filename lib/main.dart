import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Latihan Notification Widget'),
      ),
      body: Center(
        child: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text('Ini Toast'),
                onPressed: () {
                  iniToast();
                },
              ),
              MaterialButton(
                child: Text('Ini Snackbar'),
                onPressed: () {
                  iniSnackbar();
                },
              ),
              MaterialButton(
                child: Text('Ini Snackbar'),
                onPressed: () {
                  iniAlert(context);
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  iniToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'Message Toast',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    });
  }

  void iniSnackbar() {
    setState(() {
      final snackbar = SnackBar(
          content: Text('Message Snackbar'),
          duration: Duration(seconds: 4),
          action: SnackBarAction(label: 'Undo', onPressed: () {}));
      _scaffoldkey.currentState.showSnackBar(snackbar);
    });
  }

  void iniAlert(BuildContext context) {
    setState(() {
      Widget buttonCancel = MaterialButton(
        child: Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      Widget buttonOK = MaterialButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      AlertDialog alert = AlertDialog(
        title: Text('Alert Title', style: TextStyle(color: Colors.red)),
        content: Text('Alert Content Placed Here'),
        actions: [
          buttonCancel,
          buttonOK,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    });
  }
}
