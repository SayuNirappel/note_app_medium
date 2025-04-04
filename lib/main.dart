import 'package:flutter/material.dart';
import 'package:note_app_medium/data_base/data_base.dart';
import 'package:note_app_medium/view/add_tasks_screen/add_tasks_screen.dart';
import 'package:note_app_medium/view/notes_home_screen/notes_home_screen.dart';
import 'package:note_app_medium/view/task_details_screen/task_details_screen.dart';

void main() {
  final database = AppDatabase(); //creates the instance of database
  runApp(Myapp(database: database)); //passing database instance to app
}

class Myapp extends StatelessWidget {
  final AppDatabase database; //stores database instance in MyApp
  const Myapp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: NotesHomeScreen(),
      //home: TaskDetailsScreen(),
      home: AddTasksScreen(database: database),
    );
  }
}
