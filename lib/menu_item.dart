
import 'package:flutter/material.dart';

class MenuItem{

  Icon icon;
  String title;
  Icon option;
  bool selected;

  MenuItem({this.icon, @required this.title, this.option, this.selected});

}

enum MenuOption{
  GOAL,
  TASK,
  ACTIVITY,
  SETTINGS,
  HELP,
  ABOUT,
  RESTORE_PURCHASE,
  LOGOUT
}