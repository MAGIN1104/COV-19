

class Contador{
  int confirmados;
  int decesos;
  int recuperados;
  int sospechosos;
  int descartados;

  Contador({
    this.confirmados,
    this.decesos,
    this.recuperados,
    this.sospechosos,
    this.descartados,
  });

  Contador.fromJson(Map<String,dynamic> json){
    this.confirmados  = json['confirmados'];
    this.decesos      = json['decesos'];
    this.recuperados  = json['recuperados'];
    this.sospechosos  = json['sospechosos'];
    this.descartados  = json['descartados'];
  }

}