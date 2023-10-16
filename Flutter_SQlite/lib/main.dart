import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_sqlite_lab2/db_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQlite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MAD project !!!!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> loadnotes() async {
    DbHelper dbHelper = DbHelper();
    final notelist = await dbHelper.queryAll();
    setState(() {
      notes = notelist;
    });
  }

  @override
  Void initState() {
    super.initState();
    _lo
  }
}
