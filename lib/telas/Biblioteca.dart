import 'package:flutter/material.dart';


class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Text(
            "Biblioteca",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
              color: Colors.grey

          ),
        ),

      ),
    );
  }
}
