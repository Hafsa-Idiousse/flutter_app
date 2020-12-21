import 'package:flutter/material.dart';
import 'package:flutter_app3/Screens/Auth/Authenticate.dart';
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: RaisedButton(
        child: Text('Se connecter'),
        onPressed: (){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder:(context) => Authenticate()));
        }
      ),
    );
  }
}
