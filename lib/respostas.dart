import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // background
          foregroundColor: Colors.white, // foreground
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}