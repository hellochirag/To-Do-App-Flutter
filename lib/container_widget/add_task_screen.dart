import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/providers/todos_model.dart';
import 'package:todoapp/models/task.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'dart:io';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  bool isTitleEmpty = false;
  bool isDescription = false;
  File imageToDo;

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    setState(() {
      imageToDo = image;
    
    });
  }

  void onAdd() {
    final String textTitle = taskTitleController.text;
    final String textDescription = taskDescriptionController.text;

    setState(() {
      textTitle.isEmpty ? isTitleEmpty = true : isTitleEmpty = false;
      textDescription.isEmpty ? isDescription = true : isDescription = false;
    });

    if (textTitle.isNotEmpty && textDescription.isNotEmpty) {
      final Task todo = Task(
        title: textTitle,
        description: textDescription,
        image: imageToDo,
      );
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: taskTitleController,
                    decoration: new InputDecoration(
                      errorText: isTitleEmpty ? 'Value Can\'t Be Empty' : null,
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: 'Enter Title',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: taskDescriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: new InputDecoration(
                        errorText:
                            isDescription ? 'Value Can\'t Be Empty' : null,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: 'Write Description'),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: imageToDo == null
                        ? Text('No image selected.')
                        : Image.file(imageToDo),
                  ),
                  RaisedButton(
                    child: Text('Upload Photo'),
                    onPressed: getImage,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
