import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Roxo', 'pontuacao': 5},
        {'texto': 'Preto', 'pontuacao': 3},
        {'texto': 'Rosa', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Cão', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Esquilo', 'pontuacao': 3},
        {'texto': 'Koala', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o teu carro preferido?',
      'respostas': [
        {'texto': 'VW', 'pontuacao': 10},
        {'texto': 'Seat', 'pontuacao': 5},
        {'texto': 'Audi', 'pontuacao': 3},
        {'texto': 'Skoda', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual a tua cena fav?',
      'respostas': [
        {'texto': 'YO', 'pontuacao': 10},
        {'texto': 'LOLOO', 'pontuacao': 5},
        {'texto': 'Zumba', 'pontuacao': 3},
        {'texto': 'Lálá', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
