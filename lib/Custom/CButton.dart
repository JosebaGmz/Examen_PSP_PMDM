import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  double paddingH;
  double paddingV;

  CButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.paddingH = 65,
    this.paddingV = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          primary: Colors.blue, // Cambia el color según sea necesario
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
