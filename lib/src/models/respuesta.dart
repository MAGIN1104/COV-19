
import 'package:emi_covid/src/models/Departamentos.dart';
import 'package:emi_covid/src/models/contador.dart';
import 'package:emi_covid/src/models/porcentaje.dart';



class Respuesta{
  String fecha;
  Departamentos departamentos;
  Contador contador;
  int total;
  Porcentaje porcentaje;

  Respuesta({
     this.fecha,
     this.departamentos,
     this.contador,
     this.total,
     this.porcentaje,
  });

  Respuesta.fromJson(Map<String, dynamic> json){
     this.fecha           = json['fecha'];
     this.departamentos   = Departamentos.fromJson(json['departamento']);
     this.contador        = Contador.fromJson(json['contador']);
     this.total           = json['total']; 
     this.porcentaje      = Porcentaje.fromJson(json['porcentaje']);
  }
}