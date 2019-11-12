import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/models/task.dart';
import 'package:todoapp/providers/todos_model.dart';

// ignore: must_be_immutable
class TaskGridItem extends StatelessWidget {
  final Task task;

  TaskGridItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          SizedBox(height: 20),
          task.image == null
          ? FlutterLogo(size: 56.0)
          : Image.file(task.image),
          SizedBox(height: 20),
          Text(task.title, textAlign: TextAlign.center),
          SizedBox(height: 20),
          Text(task.description),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
            },
          ),
        ])));
  }
}
