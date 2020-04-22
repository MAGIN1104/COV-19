import 'package:emi_covid/src/models/respuesta.dart';
import 'package:emi_covid/src/providers/rest_provider.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/Cabecera/dateUpdate.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/bodyHomePage/container.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/bodyHomePage/fondo.widget.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/bodyHomePage/smallContainers.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/constant.homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
final provider = RestProvider();
@override
  Widget build(BuildContext context) {
    bloque();
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
                        future: provider.getData(),
                        builder: (BuildContext context, AsyncSnapshot<Respuesta> snapshot){
                          if(snapshot.hasData){
                              Respuesta resp= snapshot.data;
                              return CabeceraBol(date: resp.fecha);
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
                  margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FutureBuilder(
                        future: provider.getData(),
                        builder:(BuildContext context, AsyncSnapshot<Respuesta> snapshot){
                          if(snapshot.hasData){
                            Respuesta resp= snapshot.data;
                            return 
                            SmallContainer(
                                title: 'CONFIRMADOS',
                                number: '${resp.contador.confirmados}',
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
                        future: provider.getData(),
                        builder:(BuildContext context, AsyncSnapshot<Respuesta> snapshot){
                          if(snapshot.hasData){
                            Respuesta resp= snapshot.data;
                            return 
                            SmallContainer(
                                title: 'MUERTES',
                                number: '${resp.contador.decesos}',
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
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: RaisedButton(
                    color: Colors.indigo,
                    child: Text(
                      "DATOS DEPARTAMENTALES",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: (){
                       Navigator.pushNamed(context, '/departament');
                    },
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




