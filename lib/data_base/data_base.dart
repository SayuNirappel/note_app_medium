import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:ffi';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart'; // Import this to check if running on Web

part 'data_base.g.dart'; // Required for generated code

@DriftDatabase(tables: [Notes]) // generating table notes in a db
class AppDatabase extends _$AppDatabase {
  //appDatabase auto generated dbclass in drift
  AppDatabase() : super(_openConnection()); //initializing db connection
  @override
  int get schemaVersion => 1; //version number
}

//creating and opening db when its only needed in Lazy manner
///
///
///
// LazyDatabase _openConnection() {
//   //LazyDB is a special db to make sure connection created when only needed

//   return LazyDatabase(() async {
//     //returns lazydb instance
//     //
//     //  Detect Web and Use WebDatabase
//     if (Platform.isAndroid || Platform.isIOS) {
//       final directory =
//           await getApplicationDocumentsDirectory(); //path provider package for internl file storage
//       //dbpath is the full path to the db file
//       final dbpath = p.join(
//           directory.path, "notes.db"); //joind directory path and db file name
//       return NativeDatabase(File(dbpath));
//     } // initializing db and creating file object that rpresents dbfile.
//     else {
//       //  Use WebDatabase for Chrome
//       return WebDatabase('notes_db');
//     }
//   });
// }
///
///
///

// ✅ SQLite Initialization
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'notes.db'));

    return NativeDatabase.createInBackground(file);
  });
}

@DataClassName("Note") // create data class named Note
//represents each row in Notes table
// Define the Notes Table
class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get details => text().nullable()();
  TextColumn get category => text()();
  TextColumn get priority => text()();
  DateTimeColumn get date => dateTime()();
}
