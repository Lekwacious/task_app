import 'package:flutter/material.dart';
import 'package:shortpoint_todo_app/components/app_colors.dart';
import 'package:shortpoint_todo_app/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      // theme: ThemeData(
      //
      //   colorScheme: ColorScheme.fromSeed(seedColor: appBlueColor),
      //   useMaterial3: true,
      // ),
      home: HomeScreen(),
    );
  }
}


