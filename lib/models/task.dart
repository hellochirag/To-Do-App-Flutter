import 'package:flutter/material.dart';
import 'dart:io';

class Task {
  String title;
  String description;
  File image;

  Task({@required this.title, this.description,this.image});
}
