import 'package:dataclass/dataclass.dart';
import 'package:emi_covid/src/widgets/Botonyn.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  String title = "TEST DE COVID-19 EMI";
  int _currentStep = 0;
  // int currentIndex = 0;
  // Question current = preguntas[0];
  // String currentCategory = preguntas[0].category;
  // String currentQuestion = preguntas[0].question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('CUESTIONARIO 1'),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                child: Image.asset(
                  'img/people.png',
                  fit: BoxFit.contain,
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'En la última semana, ¿has presentado estos síntomas?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              ItemQuestionCheckBox(question: 'Dificultad para respirar'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              ItemQuestionCheckBox(question: 'DIFICULTAD PARA RESPIRAR'),
              Padding(
                padding: EdgeInsets.all(16),
                child: RaisedButton(
                  shape: StadiumBorder(),
                  child: Text('Siguiente'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _fakeContent() {
    return Column(
      children: List.generate(
        20,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('datos traidos desde otro lado'),
        ),
      ),
    );
  }
}

class ItemQuestionCheckBox extends StatefulWidget {
  final String question;

  ItemQuestionCheckBox({this.question});

  @override
  _ItemQuestionCheckBoxState createState() => _ItemQuestionCheckBoxState();
}

class _ItemQuestionCheckBoxState extends State<ItemQuestionCheckBox> {
  bool _swQuestion = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: CheckboxListTile(
        // TODO: View color to OMI page
        activeColor: Colors.red,
        selected: _swQuestion,
        value: _swQuestion,
        onChanged: (value) {
          setState(() {
            _swQuestion = value;
          });
        },
        title: Text(widget.question),
        // controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
