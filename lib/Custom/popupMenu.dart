import 'package:flutter/material.dart';
import 'package:flutter_app3/Screens/Home/home.dart';
class CustomPopupMenu {
  CustomPopupMenu(this.title);
  String title;
}
List<CustomPopupMenu> listChoices = [
  CustomPopupMenu('Home'),
  CustomPopupMenu('Actualiser'),
];
class SelectedOption extends StatelessWidget {
  CustomPopupMenu choice;
  SelectedOption(this.choice);
  @override
  Widget build(BuildContext context) {
    return Container(child: AppBar(title: Text(choice.title),),);
  }
}
