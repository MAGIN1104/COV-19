import 'package:flutter/material.dart';

import 'package:emi_covid/src/models/question.dart';
import 'package:emi_covid/src/widgets/questionPage-widgets/item_question_check_box.dart';

class QuestionsPageCat2 extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPageCat2> {
  String title = "TEST DE COVID-19 EMI";

  List<Question> _pregCat2 = preguntasCategoria2;
  String _titulo2 = category2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Covid-19 Test'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2), () => 1),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return _body();
          }

          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ));
        },
      ),
    );
  }

  Widget _body() {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ListView(
        children: <Widget>[
          _image(),
          _titleQuestion(),
          _preguntas(_pregCat2),
          _nextButton(),
        ],
      ),
    );
  }

  Widget _preguntas(List<Question> pregs) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.of(
        pregs.map(
          (question) => ItemQuestionCheckBox(question: question),
        ),
      ),
    );
  }

  Widget _image() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
      child: Image.asset(
        'img/doctor.png',
        fit: BoxFit.contain,
        height: 150,
      ),
    );
  }

  Widget _titleQuestion() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        _titulo2,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: RaisedButton(
        color: Color(0xff0095c2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textColor: Colors.white,
        child: Text('Siguiente'),
        onPressed: () {
          Navigator.of(context).pushNamed('/questions3');
        },
      ),
    );
  }
}
