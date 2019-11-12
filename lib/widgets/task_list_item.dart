import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/models/task.dart';
import 'package:todoapp/providers/todos_model.dart';

// ignore: must_be_immutable
class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: task.image == null
          ? FlutterLogo(size: 56.0)
          : Image.file(task.image),
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
        },
      ),
    ));
  }
}
