

import 'package:emi_covid/src/models/departamento.dart';

class Departamentos{
  Departamento lp;
  Departamento cb;
  Departamento sc;
  Departamento or;
  Departamento pt;
  Departamento tj;
  Departamento ch;
  Departamento bn;
  Departamento pn;
  
  Departamentos({
    this.lp,
    this.cb,
    this.sc,
    this.or,
    this.pt,
    this.tj,
    this.ch,
    this.bn,
    this.pn,
  });

  Departamentos.fromJson(Map<String, dynamic> json){
    this.lp = Departamento.fromJson(json['lp']);
    this.cb = Departamento.fromJson(json['cb']);
    this.sc = Departamento.fromJson(json['sc']);
    this.or = Departamento.fromJson(json['or']);
    this.pt = Departamento.fromJson(json['pt']);
    this.tj = Departamento.fromJson(json['tj']);
    this.ch = Departamento.fromJson(json['ch']);
    this.bn = Departamento.fromJson(json['bn']);
    this.pn = Departamento.fromJson(json['pn']);
  }

}