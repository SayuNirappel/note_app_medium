import 'package:flutter/material.dart';
import 'package:note_app_medium/controller/notes_screen_controller.dart';

void main() {}

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Add New",
          style: TextStyle(color: Colors.white),
        ),
      ),

      ///
      ///-------------------body----------------------------
      ///

      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 13,
              children: [
                ///
                ///-----------------Title---------------------------
                ///
                TextFormField(
                  controller: titleController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Enter Title",
                      hintStyle: TextStyle(color: Colors.white),
                      label:
                          Text("Title", style: TextStyle(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide:
                              BorderSide(color: Colors.lightGreenAccent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide: BorderSide(color: Colors.redAccent))),
                ),

                ///
                ///-----------------Details---------------------------
                ///
                TextFormField(
                  controller: detailsController,
                  style: TextStyle(
                      color: Colors.white, overflow: TextOverflow.ellipsis),
                  minLines: 5,
                  maxLines: 15,
                  decoration: InputDecoration(
                      hintText: "Enter Details",
                      hintStyle: TextStyle(color: Colors.white),
                      label: Text(
                        "Details",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide:
                              BorderSide(color: Colors.lightGreenAccent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide: BorderSide(color: Colors.redAccent))),
                ),

                ///
                ///------------------Category Selection---------------------------
                ///
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.grey.shade400),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                        dropdownColor: Colors.grey.shade300,
                        isExpanded: true,
                        value: NotesScreenController.selectedCategory,
                        menuWidth: MediaQuery.sizeOf(context).width,
                        hint: Text(
                          "All",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade900),
                        ),
                        items: List.generate(
                            NotesScreenController.categories.length,
                            (index) => DropdownMenuItem(
                                value: NotesScreenController.categories[index],
                                child: Text(
                                    NotesScreenController.categories[index]))),
                        onChanged: (value) {
                          NotesScreenController.onCategorySelection(value);
                          setState(() {});
                        }),
                  ),
                ),

                ///
                ///------------------Priority Selecion----------------------------
                ///
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.grey.shade400),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                        dropdownColor: Colors.grey.shade300,
                        isExpanded: true,
                        value: NotesScreenController.selectedPriority,
                        menuWidth: MediaQuery.sizeOf(context).width,
                        hint: Text(
                          "Set Priority",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey.shade900),
                        ),
                        items: List.generate(
                            NotesScreenController.priorities.length,
                            (index) => DropdownMenuItem(
                                value: NotesScreenController.priorities[index],
                                child: Text(
                                    NotesScreenController.priorities[index]))),
                        onChanged: (value) {
                          NotesScreenController.onPrioritySelection(value);
                          setState(() {});
                        }),
                  ),
                ),

                ///
                ///-----------------Date Selection-------------------
                ///
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    dateController.text =
                        await NotesScreenController.onDateSelection(context);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      label: Text(
                        "Select Date",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide:
                              BorderSide(color: Colors.lightGreenAccent)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                          borderSide: BorderSide(color: Colors.redAccent))),
                ),

                ///
                ///---------------------Action Buttton---------------
                ///
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        color: Colors.blueGrey),
                    //margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
