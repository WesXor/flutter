import 'package:flutter/material.dart';


class Inscricao extends StatefulWidget {
  const Inscricao({super.key});

  @override
  State<Inscricao> createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Text(
          "Inscrição",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
              color: Colors.grey,


          ),
        ),

      ),
    );
  }
}