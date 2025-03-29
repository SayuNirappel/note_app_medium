import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesScreenController {
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
    "Level 0 - Low",
    "Level 1",
    "Level 2 - Normal",
    "Level 3",
    "Level 4 - High"
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
}
