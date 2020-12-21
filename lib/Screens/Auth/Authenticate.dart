import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}
class _AuthenticateState extends State<Authenticate> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlatButton(
        child: Text('GOOGLE'),
        onPressed: (){},
      ),
    );
  }
}
