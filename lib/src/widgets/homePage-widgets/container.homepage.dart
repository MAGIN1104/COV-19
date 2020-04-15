import 'dart:js';

import 'package:emi_covid/src/pages/QuestionsPage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/constant.homepage.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/textContent.dart';
import 'package:flutter/material.dart';
class Contenedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.only(top: 20.0),
          width: MediaQuery.of(context).size.width/1.2,
          //height: MediaQuery.of(context).size.height/2,
          decoration: BoxDecoration(
            color: Color(0xff030c36).withOpacity(0.4),
            borderRadius: BorderRadius.circular(20.0)
            
          ),
       child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                width: 200.0,
                height:200.0,
                child: Image.asset('img/logo_emi.jpg'),
              ),
              TextContent(
                 text: 'TEST DE COVID-19 EMI',
                 style: kTitle
              ),
              TextContent(
                text:'TE RECORDAMOS QUE ESTE TEST ES SOLO UNA HERRAMIENTA PARA APOYAR AL CUIDADO DE TU SALUD.',
                style: kMessage,
              ),

              RaisedButton(
                color: Color(0xffFFCC00),
                onPressed: () {
                 Navigator.pushNamed(context, '/questions');
                },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('INICIAR TEST'),
                    Icon(Icons.arrow_forward)
                  ],
                )
              ),
           ],
         ),
       ),
    );
  }
}
