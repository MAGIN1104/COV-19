import 'dart:convert';
import 'package:emi_covid/src/models/respuesta.dart';
import 'package:http/http.dart' as http;

class RestProvider{
  final _url ='https://www.boliviasegura.gob.bo/wp-content/json/api.php'; 

  Future<Respuesta> getData() async{
    http.Response resp = await http.get(_url);
    Respuesta data = Respuesta.fromJson(jsonDecode(resp.body)); 
    return data;
  }
}