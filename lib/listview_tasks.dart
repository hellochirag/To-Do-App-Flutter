import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/providers/todos_model.dart';
import 'package:todoapp/widgets/task_list.dart';

// ignore: must_be_immutable
class TaskListView extends StatelessWidget {
  var param;
  TaskListView({Key key, this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosModel>(
        builder: (context, todos, child) => TaskList(
              tasks: todos.allTasks,
              param: param
            ),
      ),
    );
  }
}
