import 'package:flutter/material.dart';

class TextEfbook extends StatelessWidget {
  const TextEfbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'EFBOOK',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 8.0,
            color: Color.fromARGB(121, 235, 173, 50),
          ),
        ],
      ),
    );
  }
}
