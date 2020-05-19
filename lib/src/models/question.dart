String category1 = "En la última semana, ¿has presentado estos síntomas?";
String category2 =
    "En la última semana, ¿has presentado estos síntomas secundarios?";

class Question {
  final String question;
  final String category;
  final double valor;

  Question(this.question, this.valor, this.category);
}

var preguntasCategoria1 = [
  Question("DIFICULTAD PARA RESPIRAR", 1, category1),
  Question("FIEBRE (mayor a 38 ºC)", 1, category1),
  Question("TOS (seca, sin flema)", 1, category1),
  Question("DOLOR EN PECHO", 1, category1),
  Question("DOLOR DE CABEZA", 1, category1),
];

var preguntasCategoria2 = [
  Question("IRRITABILIDAD", 1, category2),
  Question("DIARREA (Persistente)", 1, category2),
  Question("VÓMITO (Persistente)", 1, category2),
  Question("ESCALOFRÍOS", 1, category2),
  Question("DOLOR DE ESTÓMAGO", 1, category2),
  Question("ERUPCIONES CUTÁNEAS", 2, category2),
  Question("MALESTAR GENERAL", 2, category2),
  Question("ESCURRIMIENTO NASAL", 10, category2),
  Question("RESPIRACIÓN RÁPIDA", 5, category2),
  Question("DOLOR EN GARGANTA", 2, category2),
  Question("CONJUNTIVITIS", 2, category2),
  Question("DEDOS/LABIOS AZULADOS", 1, category2),
  Question("CONVULSIONES", 1, category2),
];
