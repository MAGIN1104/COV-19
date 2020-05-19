import 'package:emi_covid/src/pages/CovidDepartamentosPage.dart';
import 'package:emi_covid/src/pages/HomePage.dart';
import 'package:emi_covid/src/pages/QuestionsPageCat1.dart';
import 'package:emi_covid/src/pages/QuestionsPageCat2.dart';
import 'package:emi_covid/src/pages/QuestionsPageCat3.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/questions1": (context) => QuestionsPageCat1(),
        "/questions2": (context) => QuestionsPageCat2(),
        "/questions3": (context) => QuestionsPageCat3(),
        "/departament": (context) => CovidDepartament(),
      },
    );
  }
}