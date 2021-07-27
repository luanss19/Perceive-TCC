import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/dados/salvamento.dart';
import 'package:perceive/telas/criacaoJogador.dart';
import 'package:perceive/telas/telaAcessibilidade.dart';
import 'package:perceive/historia/cerebroHistoria.dart';
import 'package:perceive/telas/telaInGame.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/global.dart' as globais;

void main() {
  runApp(GetMaterialApp(
    title: 'Perceive',
    home: TelaInicial(),
  ));
}

cerebroHistoria _historia = new cerebroHistoria();

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  List<Jogador> jogadores = [];
  final FlutterTts flutterTts = FlutterTts();

  Salvamento salvamento = Salvamento();
  Widget build(BuildContext context) {
    speak(String text) async{
      await flutterTts.setLanguage("pt-BR");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);

    }
    return Scaffold(
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Text("PERCEIVE",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
              SizedBox(
                height: 120.0
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {
                        setState(() {
                        _historia.numeroHistoria = 0;
                        speak(_historia.historia.tituloHistoria);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => TelaInGame()));
                        });},
                      child: Text('Novo Jogo'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {
                        print(_historia.numeroHistoria);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => TelaInGame()));
                      },
                      child: Text('Continuar Jogo'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => TelaInGame()));
                      },
                      child: Text('Carregar Salvo'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child:RaisedButton(
                      color: Colors.grey,
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => TelaAcessibilidade()));
                      print(globais.acessibilidadeOn);
                      },
                      child: Text('Opções de acessibilidade'),
                      ),
                  ),
                )
              ]
              ),
              SizedBox(
                height: 140,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text('V1.0.'),
                  ),
                  SizedBox(
                    width: 25.0,
                    height: 20.0,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Créditos'),
                  ),
                ],
              )
            ])));

  }
  _criacaoJogador({required Jogador jogador}) async {
    final jogadorRetornado = await Navigator.push(context,
        MaterialPageRoute(builder: (contxt) => criacaoJogador(jogador: jogador)));

    if(jogadorRetornado != null) {
      if(jogador != null) {
        await salvamento.atualizarJogador(jogadorRetornado);
      }
      else {
        await salvamento.salvar(jogadorRetornado);
      }
    }
  }
}
