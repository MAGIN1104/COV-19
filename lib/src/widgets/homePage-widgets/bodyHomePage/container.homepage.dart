import 'package:emi_covid/src/widgets/homePage-widgets/bodyHomePage/textContent.dart';
import 'package:emi_covid/src/widgets/homePage-widgets/constant.homepage.dart';
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
            color: Color(0xff030c36).withOpacity(0.3),
            borderRadius: BorderRadius.circular(10.0)
            
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
                onPressed: () => _mostrarAlert(context),
                 //Navigator.pushNamed(context, '/questions');
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

  void _mostrarAlert(BuildContext context) {
    showDialog(
      
      context:context,
      builder: (context){
      
        return AlertDialog(
        
          title: Text('Importante', style: TextStyle(color: Colors.blue)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'EN NINGÚN MOMENTO SE DEBE TOMAR LO SUGERIDO EN EL TEST COMO UN DIAGNÓSTICO, TE RECOMENDAMOS CONSULTAR CON UN MÉDICO  SOBRE EL RESULTADO DE TU ORIENTACIÓN.',
                style: TextStyle(
                  fontSize: 15.0
                ), 
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(),
              ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.popAndPushNamed(context, '/questions1');
              },
              )
          ],
        );
      } 
    );
  }
}

