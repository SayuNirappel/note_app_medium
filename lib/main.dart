import 'package:flutter/material.dart';
import 'package:note_app_medium/view/notes_home_screen/notes_home_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesHomeScreen(),
    );
  }
}
