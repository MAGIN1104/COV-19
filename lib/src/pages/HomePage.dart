import 'package:emi_covid/src/widgets/homePage-widgets/CityDate.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/constant.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/smallContainers.homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/container.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/fondo.widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ui';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    void bloque(){
    SystemChrome.setPreferredOrientations([
      /**PARA MANTENER VERTICAL */
      DeviceOrientation.portraitUp,     
      DeviceOrientation.portraitDown
    ]);
  }

  int confirmed;
  int deaths;
  String date;
  String city;
  @override
  void getData() async{
    http.Response response = await http.get('https://api.covid19api.com/summary');
    if(response.statusCode==200){
      String data=response.body;
      city = jsonDecode(data)['Countries'][26]['Country'];
      confirmed = jsonDecode(data)['Countries'][26]['TotalConfirmed'];
      deaths = jsonDecode(data)['Countries'][26]['TotalDeaths'];
      date = jsonDecode(data)['Countries'][26]['Date'];
      print(city);
      print(confirmed);
      print(deaths);
      print(date);
    }else{
      print(response.statusCode);
    }
  }

  Widget build(BuildContext context) {
    bloque();
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba Covid-19'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
          children: <Widget>[
          FondoImagen(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[

                CityDate(city: city, date: date),

                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 40.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      SmallContainer(
                        title: 'CONFIRMADOS',
                        number: confirmed.toString(),
                        style:  ktittlesc,
                        styleT: TextStyle(
                        color:  Color(0xffFFCC00),
                        fontWeight: FontWeight.bold,
                      )
                      ),
                     SmallContainer(
                        title: 'DECESOS',
                        number: deaths.toString(),
                        style: ktittlesc,
                        styleT: TextStyle(
                          color:  Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),

                Contenedor(),
              ],
            )
            ),
        ],
      ),
    );
  }
}




