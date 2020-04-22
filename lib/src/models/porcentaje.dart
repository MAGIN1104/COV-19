
class Porcentaje {
  String confirmados;
  String decesos;
  String recuperados;
  String sospechosos;
  String descartados;

  Porcentaje({
    this.confirmados,
    this.decesos,
    this.recuperados,
    this.sospechosos,
    this.descartados,
  });
  Porcentaje.fromJson(Map<String,dynamic>json) {
    this.confirmados    = json['confirmados'];
    this.decesos        = json['decesos'];
    this.recuperados    = json['recuperados'];
    this.sospechosos    = json['sospechosos'];
    this.descartados    = json['descartados'];


  }
}
