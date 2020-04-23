

import 'package:emi_covid/src/models/contador.dart';
import 'package:emi_covid/src/models/porcentaje.dart';

class Departamento {
  Contador contador;
  int total;
  Porcentaje porcentaje;

  Departamento({
    this.contador,
    this.total,
    this.porcentaje,
  });

  Departamento.fromJson(Map<String,dynamic> json){
    this.contador   = Contador.fromJson(json['contador']);
    this.total      = json['total'];
    this.porcentaje = Porcentaje.fromJson(json['porcentaje']);

  }
}
