import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String title = "TEST DE COVID-19 EMI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      ),
      appBar: AppBar(
        title: Text('Prueba Covid-19'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    width: 300.0,
                    height: 300.0,
                    child: Image.asset('img/logo_emi.jpg')
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0 
                    ),
                      
                    ),
                  Text(
                      "TE RECORDAMOS QUE ESTE TEST ES SOLO UNA HERRAMIENTA PARA APOYAR AL CUIDADO DE TU SALUD.",
                      textAlign: TextAlign.center,    
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pushNamed(context, '/questions');
                  },
                  child: Text(
                      'Iniciar Test',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}