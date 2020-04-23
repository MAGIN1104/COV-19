import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderDepart extends StatelessWidget {
  final Color whiteColor=Colors.white.withOpacity(0.7);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.0)),
        child: Stack(
        children: <Widget>[
          _IconHeaderBackground(),
          Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 250,
              color: Colors.white.withOpacity(0.2)
            )
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 80.0, width: double.infinity,),
              Text(
                'Datos Departamentales',
                 style: TextStyle(
                   fontSize: 20.0,
                   color: whiteColor
                  ),
              ),
              SizedBox(height: 20.0),
              Text(
                'COVID-19',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold 
                ),
              ),
              SizedBox(height: 5.0),
              FaIcon(FontAwesomeIcons.hospital, color: whiteColor, size: 70.0,)
            ],
          )
        ],
      ),
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0XFF526BF6),
            Color(0xFF67ACF2),
          ]
        )
      ),
    );
  }
}