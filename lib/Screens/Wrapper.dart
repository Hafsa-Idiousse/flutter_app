import 'package:flutter/material.dart';
import 'package:flutter_app3/Screens/Auth/Authenticate.dart';
import 'package:flutter_app3/Screens/Home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
