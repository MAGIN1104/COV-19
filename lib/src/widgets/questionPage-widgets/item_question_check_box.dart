import 'package:flutter/material.dart';
import 'package:emi_covid/src/models/result_test.dart';
import 'package:emi_covid/src/models/question.dart';

class ItemQuestionCheckBox extends StatefulWidget {
  final Question question;

  ItemQuestionCheckBox({this.question});

  @override
  _ItemQuestionCheckBoxState createState() => _ItemQuestionCheckBoxState();
}

class _ItemQuestionCheckBoxState extends State<ItemQuestionCheckBox> {
  bool _swQuestion = false;
  ResultTest resTest = ResultTest();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: CheckboxListTile(
        activeColor: Color(0xff0095c2),
        selected: _swQuestion,
        value: _swQuestion,
        onChanged: (value) {
          setState(() {
            _swQuestion = value;
            resTest.valor = value
                ? resTest.valor + (widget.question.valor ~/ 1)
                : resTest.valor - (widget.question.valor ~/ 1);
          });
        },
        title: Text(widget.question.question),
        // controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
