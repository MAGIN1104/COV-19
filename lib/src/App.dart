import 'package:emi_covid/src/pages/HomePage.dart';
import 'package:emi_covid/src/pages/QuestionView/QuestionsPage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/questions": (context) => QuestionsPage(),

      },
    );
  }
}