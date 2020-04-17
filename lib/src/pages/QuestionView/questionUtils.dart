
import 'package:dataclass/dataclass.dart';

String category1 = "En la última semana, ¿has presentado estos síntomas?";
String category2 = "En la última semana, ¿has presentado estos síntomas secundarios?";

double totalScore = 0;

@dataClass
class Question {
  String question;
  String category;
  double valor;
  bool answer;
  Question(this.question, this.valor, this.category, this.answer);
  String toString(){
    return 'Question: $question, $valor, $answer';
  }

}

var preguntasSintomasPrimarios = [
  Question("DIFICULTAD PARA RESPIRAR", 10, category1, true),
  Question("FIEBRE (mayor a 38 ºC)", 10, category1, true),
  Question("TOS (seca, sin flema)", 10, category1, false),
  Question("DOLOR EN PECHO", 10, category1, true),
  Question("DOLOR DE CABEZA", 10, category1, true)
];

var preguntasSintomasSecundarios = [
  Question("IRRITABILIDAD", 1, category2, false),
  Question("DIARREA (Persistente)", 1, category2, false),
  Question("VÓMITO (Persistente)", 1, category2, false),
  Question("ESCALOFRÍOS", 1, category2, false),
  Question("DOLOR DE ESTÓMAGO", 1, category2, false),
  Question("ERUPCIONES CUTÁNEAS", 2, category2, false),
  Question("MALESTAR GENERAL", 2, category2, false),
  Question("ESCURRIMIENTO NASAL", 10, category2, false),
  Question("RESPIRACIÓN RÁPIDA", 5, category2, false),
  Question("DOLOR EN GARGANTA", 2, category2, false),
  Question("CONJUNTIVITIS", 2, category2, false),
  Question("DEDOS/LABIOS AZULADOS", 1, category2, false),
  Question("CONVULSIONES", 1, category2, false)
];


void calcularScore(){
  for(int i = 0; i<preguntasSintomasPrimarios.length; i++){
    totalScore += preguntasSintomasPrimarios[i].valor;
  }
  print(totalScore);
}