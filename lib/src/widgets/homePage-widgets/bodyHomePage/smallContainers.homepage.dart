import 'package:flutter/material.dart';
class SmallContainer extends StatelessWidget {
  SmallContainer({@required this.title, @required this.number, @required this.style, @required this.styleT});
  final String title;
  final String number;
  final TextStyle style; 
  final TextStyle styleT; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width/2.5,
      decoration: BoxDecoration(
       color: Color(0xff030c36).withOpacity(0.6),
        borderRadius: BorderRadius.circular(10.0)
      ), 
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: styleT
            ),
           Text(
            number,
            style: style
          ),
        ],
      ),
    );
  }
}
