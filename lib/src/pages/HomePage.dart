import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String title = "TEST DE COVID-19 EMI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      ),
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(

                  ), width: 300.0,
                  height: 300.0,
                  child: Image.asset('img/logo_emi.jpg')
              ),
              Text(title),
              Text(
                  "TE RECORDAMOS QUE ESTE TEST ES SOLO UNA HERRAMIENTA PARA APOYAR AL CUIDADO DE TU SALUD."),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/questions');
                },
                child: Text(
                    'Iniciar Test',
                    style: TextStyle(fontSize: 20)
                ),
              ),
            ],
          )
      ),
    );
  }
}