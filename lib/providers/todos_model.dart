import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:todoapp/models/task.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> _tasks = [];
  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);
  void addTodo(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
