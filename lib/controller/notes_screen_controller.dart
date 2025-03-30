import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app_medium/data_base/data_base.dart';

class NotesScreenController {
  final AppDatabase database;
  NotesScreenController(this.database);
  static String? selectedCategory;
  static String? selectedPriority;
  static const List<String> categories = [
    "All",
    "Personal",
    "Work",
    "Daily Routine",
    "Study",
    "Finance",
    "Health & Fitness",
    "Travel",
    "Shopping Lists",
    "Ideas & Inspiration",
    "To-Do Lists",
    "Events & Appointments"
  ];
  static const List<String> priorities = [
    "Level 0",
    "Level 1",
    "Level 2",
    "Level 3",
    "Level 4"
  ];

  static void onCategorySelection(String? value) {
    selectedCategory = value;
  }

  static void onPrioritySelection(String? value) {
    selectedPriority = value;
  }

  ///
  ///-----------Date Selection---------------
  ///

  static Future<String> onDateSelection(BuildContext context) async {
    var selectedDate = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2035));
    //return "";

//     //print(selectedDate);

//     // format date

    if (selectedDate != null) {
      String formatedDate = DateFormat("dd/MM/yyyy").format(selectedDate);
      return formatedDate;
    }
    return "";
  }

  //---------Inserting notes into database-----------------

  Future<void> insertNote(String title, String? details, String category,
      String priority, DateTime date) async {
    final note = NotesCompanion(
        title: Value(title),
        details: Value(details),
        category: Value(category),
        priority: Value(priority),
        date: Value(date));
    await database.into(database.notes).insert(note);
  }
}
