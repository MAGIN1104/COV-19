String category1 = "En la última semana, ¿has presentado estos síntomas?";
String category2 = "En la última semana, ¿has presentado estos síntomas secundarios?";

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