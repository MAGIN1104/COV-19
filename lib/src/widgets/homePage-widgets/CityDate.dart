import 'package:flutter/material.dart';
class CityDate extends StatelessWidget {
  const CityDate({
    Key key,
    @required this.city,
    @required this.date,
  }) : super(key: key);

  final String city;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width/1.2,
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(city, style: TextStyle( color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              RichText(text: TextSpan(
                children: [
                  TextSpan( text: 'Ultima actualización: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                  TextSpan( text: date)
                ]
              ))
            ],
          ),
        ],
      ),
    );
  }
}
