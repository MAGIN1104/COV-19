import 'package:emi_covid/src/widgets/homePage-widgets/Cabecera/dateUpdate.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/bodyHomePage/container.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/bodyHomePage/fondo.widget.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/bodyHomePage/smallContainers.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/constant.homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ui';
const apiKey='269403381amshd0a838e710e8995p1d5a37jsnecfbfd85f088';
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
  
   getData() async{
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
@override
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
               Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width/1.2,
                  child: Row(
                    children: <Widget>[
                      FutureBuilder(
                        future: getData(),
                        builder: (context,snapshot){
                          if(date!=null){
                              return CabeceraBol(date: date);
                          }else{
                              return CabeceraBol(date: "-");
                          }
                        }
                      ),
                      
                    ],
                  ),
                ),
                Container(
                 width: MediaQuery.of(context).size.width/1.2,
                  margin: EdgeInsets.only(bottom: 40.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FutureBuilder(
                        future: getData(),
                        builder:(context, snapshot){
                          if(date!= null){
                            return 
                            SmallContainer(
                                title: 'CONFIRMADOS',
                                number: confirmed.toString(),
                                style:  ktittlesc,
                                styleT: TextStyle(
                                color:  Color(0xffFFCC00),
                                fontWeight: FontWeight.bold,
                              )
                            );
                          }
                          else{
                            return 
                            SmallContainer(
                                title: 'CONFIRMADOS',
                                number: "-",
                                style:  ktittlesc,
                                styleT: TextStyle(
                                color:  Color(0xffFFCC00),
                                fontWeight: FontWeight.bold,
                              )
                            );
                          }    
                        }
                      ),
                    FutureBuilder(
                        future: getData(),
                        builder:(context, snapshot){
                          if(date!= null){
                            return 
                            SmallContainer(
                                title: 'MUERTES',
                                number: deaths.toString(),
                                style:  ktittlesc,
                                styleT: TextStyle(
                                color:  Colors.red,
                                fontWeight: FontWeight.bold,
                              )
                            );
                          }
                          else{
                            return SmallContainer(
                                title: 'MUERTES',
                                number: "-",
                                style:  ktittlesc,
                                styleT: TextStyle(
                                color:  Colors.red,
                                fontWeight: FontWeight.bold,
                              )
                            );
                          }    
                        }
                      ),
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




