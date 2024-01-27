import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/view/todo_page.dart';

void main()async {
  await Hive.initFlutter();
  var box = await Hive.openBox("myDB");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoUI()
    );
  }
}

