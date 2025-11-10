import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart'; // Import for web
import 'package:sqflite_common/sqflite.dart'; // Import for databaseFactory
import 'home_screen.dart';
import 'models/note.dart';
import 'db/database_helper.dart'; // Import the new DatabaseHelper

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize databaseFactory for web
  databaseFactory = databaseFactoryFfiWeb;

  await DatabaseHelper.instance.database; // Initialize the database

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Catatan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
