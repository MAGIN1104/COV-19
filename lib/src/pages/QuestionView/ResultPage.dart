import 'package:emi_covid/src/pages/QuestionView/questionUtils.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  var result = totalScore;
  @override
  Widget build(BuildContext context) {

    return Center(
        child: Text('$totalScore'),
    );
  }
}