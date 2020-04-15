import 'package:emi_covid/src/widgets/homePage-widgets/container.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/fondo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
    void bloque(){
    SystemChrome.setPreferredOrientations([
      /**PARA MANTENER VERTICAL */
      DeviceOrientation.portraitUp,     
      DeviceOrientation.portraitDown
    ]);
  }
  @override
  Widget build(BuildContext context) {
    bloque();
    return Scaffold(
      drawer: Drawer(
        
      ),
      appBar: AppBar(
        title: Text('Prueba Covid-19'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FondoImagen(),
          SingleChildScrollView(
            child: Contenedor()
            ),
        ],
      ),
    );
  }

}


