import 'package:flutter/material.dart';
class Buttonyn extends StatelessWidget {
  Buttonyn({@required this.yn});
  final String yn;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        print("si");
      },
      child: Text(
          yn,
          style: TextStyle(fontSize: 20,)
      ),
    );
  }
}