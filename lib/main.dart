import 'package:flutter/material.dart';
import 'package:todo_apps/screen/add_todo.dart';
import 'package:todo_apps/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      routes: {
        'home': (context) => HomePage(),
        'add_todo': (context) => const AddTodo(),
      },
      initialRoute: 'home',
    );
  }
}
