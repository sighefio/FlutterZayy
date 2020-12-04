import 'package:flutter/cupertino.dart';

class Menu{
  String name;
  String route;
  dynamic icon;
  Menu({this.name,this.icon,this.route});

  String get getName{
    return this.name;
  }
}