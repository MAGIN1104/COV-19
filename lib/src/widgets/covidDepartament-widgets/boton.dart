import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Boton extends StatelessWidget {
  Boton({
      @required this.departamento,
      @required this.confirmados,
      @required this.decesos,
      @required this.recuperados,
      @required this.sospechosos,
      @required this.c1,
      @required this.c2,
  });

  final String departamento;
  final String confirmados;
  final String decesos;
  final String recuperados;
  final String sospechosos;
  final Color c1;
  final Color c2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _CajaContenedora(
          color1: c1,
          color2: c2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 110, width: 40,),
                FaIcon(FontAwesomeIcons.viruses, color: Colors.white, size: 40,),
                SizedBox(width: 20),
                Expanded(child: Text(departamento, style: TextStyle(color: Colors.white, fontSize: 24.0),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 40,),
                Expanded(child: Text('CONFIRMADOS', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
                Expanded(child: Text(confirmados, style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 40,),
                Expanded(child: Text('DECESOS', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
                Expanded(child: Text(decesos, style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 40,),
                Expanded(child: Text('SOSPECHOSOS', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
                Expanded(child: Text(sospechosos, style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 40,),
                Expanded(child: Text('RECUPERADOS', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
                Expanded(child: Text(recuperados, style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),)),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _CajaContenedora extends StatelessWidget {
  _CajaContenedora(
    {
      @required this.color1,
      @required this.color2,
    }
  );
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: <Color>[
            color1,
            color2,
          ]
        )
      ),
    );
  }
}