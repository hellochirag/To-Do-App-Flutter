import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/container_widget/home_screen.dart';
import 'package:todoapp/providers/todos_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TodosModel(),
      child: MaterialApp(
        title: 'Todos',
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}

