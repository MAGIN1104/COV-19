import 'package:emi_covid/src/pages/QuestionView/questionUtils.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/fondo.widget.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

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
        alignment: Alignment.topCenter,
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
           margin: EdgeInsets.only(top: 150.0,),
           decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0))
          ),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  "PRIMERA PARTE",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20.0,
                    
                  ),
                  ),
                ),

              Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: preguntas.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
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

                              Container(
                                child: Expanded(
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
                              ),

                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
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