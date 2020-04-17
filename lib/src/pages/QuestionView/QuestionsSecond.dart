import 'package:emi_covid/src/pages/QuestionView/questionUtils.dart';
import 'package:flutter/material.dart';

class QuestionsSecond extends StatefulWidget {
  @override
  _QuestionsSecondState createState() => _QuestionsSecondState();
}

class _QuestionsSecondState extends State<QuestionsSecond> {

  var preguntas = preguntasSintomasSecundarios;
  var gray = Colors.grey;
  var red = Colors.red;
  var green = Colors.green;
  bool enableBackBtn = false;

  void setAns(Question question, bool ans){
    setState(() {
      question.answer = ans;
    });
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
          Text("gads"),

          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: preguntas.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[

                        Expanded(
                          child: SizedBox(
                              child: Text(preguntas[index].question.toString())
                          ),
                          flex: 3,
                        ),

                        Expanded(
                            flex: 1,
                            child: OutlineButton(
                              child: Text("Si", style: TextStyle(
                                color: preguntas[index].answer ? green: gray,
                              )),
                              onPressed: () {
                                setAns(preguntas[index], true);
                              },
                              borderSide: BorderSide(
                                color: preguntas[index].answer ? green: gray,
                                style: BorderStyle.solid,
                                width: 0.8,
                              ),
                            )
                        ),

                        Expanded(
                            child: OutlineButton(
                              child: Text("No", style: TextStyle(
                                color: preguntas[index].answer ? gray :red,
                              )),
                              onPressed: () {
                                setAns(preguntas[index], false);
                              },
                              borderSide: BorderSide(
                                color: preguntas[index].answer ? gray :red,
                                style: BorderStyle.solid,
                              ),
                            )
                        ),

                      ],
                    ),
                  ],
                );
              },
            ),
          ),


          RaisedButton(
            onPressed: (){
              setState(() {
                calcularScore();
                Navigator.popAndPushNamed(context, '/result');
              });
            },
            child: Text("Siguiente"),
          ),

        ],

      ),
    );
  }
}