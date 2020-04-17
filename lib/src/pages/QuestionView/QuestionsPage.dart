import 'package:emi_covid/src/pages/QuestionView/questionUtils.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> moverarriba;

  var preguntas = preguntasSintomasPrimarios;
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
        alignment: Alignment.center,
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
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5 ,bottom: MediaQuery.of(context).size.height/7, left: 5.0, right: 5.0),
           padding: EdgeInsets.all(20.0),
           decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(50.0), bottomRight:Radius.circular(50.0) )
            ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Usted tiene...",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20.0,
                    
                  ),
                  ),
                ),

              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: preguntas.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0.0),
                        child: Row(
                          children: <Widget>[

                            Expanded(

                              child: SizedBox(
                                  child: Text(preguntas[index].question.toString(), style: TextStyle( fontSize: 16.0),)
                              ),
                              flex:4,
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
                        Navigator.popAndPushNamed(context, '/questions2');
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