import 'package:emi_covid/src/pages/QuestionView/questionUtils.dart';
import 'package:emi_covid/src/widgets/Botonyn.dart';
import 'package:flutter/material.dart';

enum Status {
  sintomasPrimarios,
  sintomasSecundarios,
  preguntaOtroSintoma,
  preguntaContactoCovid
}

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  bool change = true;
  var status = Status.sintomasPrimarios;
  String title = "TEST DE COVID-19 EMI";
  int currentIndex = 0;
  var preguntas = preguntasSintomasPrimarios;
  Question _current = preguntasSintomasPrimarios[0];
  String _currentCategory = preguntasSintomasPrimarios[0].category;
  String _currentQuestion = preguntasSintomasPrimarios[0].question;
  double totalScore = 0.0;

  void nextQuestion(bool ansIsYes){
    if(ansIsYes){
      setState(() {
        totalScore += _current.valor;
        print(totalScore);
      });
    }
    setState(() {
      if(currentIndex<14)
        currentIndex++;
      if(currentIndex == 5 && status == Status.sintomasPrimarios){
        status  = Status.sintomasSecundarios;
        currentIndex = 0;
        preguntas = preguntasSintomasSecundarios;
      }else if(currentIndex == 13 && status == Status.sintomasSecundarios){
        change = false;
        status = Status.preguntaOtroSintoma;
      }else if(status == Status.preguntaOtroSintoma){
        status = Status.preguntaContactoCovid;
      }else{
        // ir al result page
      }

      _current = preguntas[currentIndex];
      _currentCategory = _current.category;
      _currentQuestion = _current.question;
    });
  }

  Widget QuestionButtonYes() {
    return RaisedButton(
      onPressed: () { nextQuestion(true); },
      child: Text(
          "Si",
          style: TextStyle(fontSize: 20,)
      ),
    );
  }

  Widget QuestionButtonNo() {
    return RaisedButton(
      onPressed: () { nextQuestion(false); },
      child: Text(
          "No",
          style: TextStyle(fontSize: 20,)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUESTIONARIO 1'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: <Widget>[
          Card(
              color: Color.fromARGB(1, 100, 0, 25),
              elevation: 20.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Poner textos con b
                  change ? Text('$_currentCategory'):
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tienes algun otro sintoma?"
                    ),
                  ),
                  Text('$_currentQuestion'),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        QuestionButtonYes(),
                        QuestionButtonNo(),
                      ],
                    ),
                  ),
                  Text('$currentIndex')
                ],
              )
          ),
        ],
      ),
    );
  }
}


