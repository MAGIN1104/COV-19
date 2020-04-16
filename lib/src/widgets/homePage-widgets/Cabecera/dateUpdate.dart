import 'package:flutter/material.dart';
class CabeceraBol extends StatelessWidget {
  const CabeceraBol({
    Key key,
    @required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Bolivia', style: TextStyle( color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
      RichText(text: TextSpan(
        children: [
          TextSpan( text: 'Ultima actualización: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
          TextSpan( text: date) 
        ]
      ))
    ],
  );
  }
}

