import 'package:flutter/material.dart';
class TextContent extends StatelessWidget {
  TextContent({@required this.text, @required this.style});
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style
      ),
    );
  }
}