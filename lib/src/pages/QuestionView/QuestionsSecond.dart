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
        title: Text('CUESTIONARIO'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('img/cv.jpg')
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
           padding: EdgeInsets.all(5.0),
           decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
            ),
            child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: preguntas.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left:5.0, right: 10.0),
                        child: Row(
                          children: <Widget>[

                            Expanded(
                              child: SizedBox(
                                  child: Text(preguntas[index].question.toString())
                              ),
                              flex: 4,
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
                      ),
                    ],
                  );
                },
              ),


              RaisedButton(
                color: Colors.green,
                onPressed: (){
                  setState(() {
                    calcularScore();
                    Navigator.popAndPushNamed(context, '/result');
                  });
                },
                child: Text("Siguiente", style: TextStyle(color: Colors.white)), 
              ),

            ],

        ),
          ),
        ],
      ),
    );
  }
}