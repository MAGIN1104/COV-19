import 'package:dataclass/dataclass.dart';
import 'package:flutter/material.dart';


String category1 = "En la última semana, ¿has presentado estos síntomas?";
String category2 = "En la última semana, ¿has presentado estos síntomas secundarios?";

@dataClass
class Question {
  final String question;
  final String category;
  final double valor;

  Question(this.question, this.valor, this.category);
}

var preguntas = [
  Question("DIFICULTAD PARA RESPIRAR", 1, category1),
  Question("FIEBRE (mayor a 38 ºC)", 1, category1),
  Question("TOS (seca, sin flema)", 1, category1),
  Question("DOLOR EN PECHO", 1, category1),
  Question("DOLOR DE CABEZA", 1, category1),

  Question("IRRITABILIDAD", 1, category2),
  Question("DIARREA (Persistente)", 1, category2),
  Question("VÓMITO (Persistente)", 1, category2),
  Question("ESCALOFRÍOS", 1, category2),
  Question("DOLOR DE ESTÓMAGO", 1, category2),
  Question("ERUPCIONES CUTÁNEAS", 1, category2),
  Question("MALESTAR GENERAL", 1, category2),
  Question("ESCURRIMIENTO NASAL", 1, category2),
  Question("RESPIRACIÓN RÁPIDA", 1, category2),
  Question("DOLOR EN GARGANTA", 1, category2),
  Question("CONJUNTIVITIS", 1, category2),
  Question("DEDOS/LABIOS AZULADOS", 1, category2),
  Question("CONVULSIONES", 1, category2),
];


class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}


class _QuestionsPageState extends State<QuestionsPage> {
  String title = "TEST DE COVID-19 EMI";
  int currentIndex = 0;
  Question current = preguntas[0];
  String currentCategory = preguntas[0].category;
  String currentQuestion = preguntas[0].question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              Text(currentCategory),
              Text(currentQuestion),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      print("si");
                    },
                    child: Text(
                        'Si',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),

                  RaisedButton(
                    onPressed: () {
                      print("no");
                    },
                    child: Text(
                        'No',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}
