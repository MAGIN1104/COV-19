import 'package:flutter/material.dart';

class FondoImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage('img/Background.jpg')
    )
      ),
    );
  }
}