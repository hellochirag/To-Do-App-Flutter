import 'package:flutter/material.dart';

import 'package:todoapp/models/task.dart';
import 'package:todoapp/widgets/task_grid_item.dart';
import 'package:todoapp/widgets/task_list_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/todos_model.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  var param;

  TaskList({@required this.tasks, this.param});

  @override
  Widget build(BuildContext context) {
    switch (param) {
      case 'LIST':
        {
          return ListView(
            children: getListViewTasks(),
          );
        }
      case 'GRID':
        {
          return GridView.count(
            crossAxisCount: 2,
            children: getGridViewTasks(),
          );
        }
      case 'STAGGERED':
        {
          return (StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) => new Container(
                color: Colors.blueAccent,
                child: new Card(
                    child: Center(
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                      tasks[index].image == null
                          ? FlutterLogo(size: 36.0)
                          : Image.file(tasks[index].image),
                      SizedBox(width: 10),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(tasks[index].title,
                                  textAlign: TextAlign.center),
                              SizedBox(height: 5),
                              Text(tasks[index].description),
                            ],
                          )),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 14,
                        ),
                        onPressed: () {
                          Provider.of<TodosModel>(context, listen: false)
                              .deleteTodo(tasks[index]);
                        },
                      )
                    ])))),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(4.0),
          ));
        }
      default:
        {
          return ListView(
            children: getListViewTasks(),
          );
        }
    }
  }

  List<Widget> getListViewTasks() {
    return tasks.map((todo) => TaskListItem(task: todo)).toList();
  }

  List<Widget> getGridViewTasks() {
    return tasks.map((todo) => TaskGridItem(task: todo)).toList();
  }
}
