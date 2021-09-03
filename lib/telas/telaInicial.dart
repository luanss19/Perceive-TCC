import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/database.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/historia/cerebroHistoria.dart';
import 'package:perceive/telas/telaAcessibilidade.dart';
import 'package:perceive/telas/telaCarregarJogo.dart';
import 'package:perceive/telas/telaInGame.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:assets_audio_player/assets_audio_player.dart';

import 'telaCriacaoJogador.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Perceive',
    home: TelaInicial(),
  ));
}


class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  late DatabasePerceive _dbHelper;
  final FlutterTts flutterTts = FlutterTts();
  AssetsAudioPlayer musica = AssetsAudioPlayer.withId("0");

  @override
  void initState() {
    final player = musica;
    final playing = player.isPlaying.value;

    if(playing != true){
    musica.open(
      Audio('assets/music/background.mp3'),
      showNotification: true,
      volume: 0.1,
    );
    musica.setLoopMode(LoopMode.single);
    musica.setVolume(globais.Globais.volumeMusica);
  }

    setState(() {
      flutterTts.stop();
      if (globais.Globais.acessibilidadeOn == true) {
        flutterTts.speak(
            "A tela inicial contém quatro botões.  Primeiro: Novo Jogo.  Segundo: Continuar Jogo.  Terceiro: Carregar Salvo.  Quarto: Opções de Acessibilidade");
      }
      _dbHelper = DatabasePerceive.instance;
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
            body: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Text("PERCEIVE",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
          SizedBox(height: 120.0),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => criacaoJogador(),
                          ));
                        });
                      },
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
                        globais.Globais.restartdemo = false;
                        if(globais.Globais.ultimoPlayer != 0){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaInGame(
                                      jogadorID: globais.Globais.ultimoPlayer)));
                        }else{
                          if(globais.Globais.acessibilidadeOn == true){
                            flutterTts.speak("Nenhum jogo foi carregado nessa sessão, inicie um jogo salvo no menu Carregar Salvo");
                          }
                          final snackBar = SnackBar(content: Text('Nenhum jogo foi carregado nessa sessão, inicie um jogo salvo no menu Carregar Salvo'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

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
                                builder: (context) => telaCarregarJogo()));
                      },
                      child: Text('Carregar Salvo'),
                    ),
                  ),
                ),
                // RaisedButton(
                //   child: Text('Inserir dados', style: TextStyle(fontSize: 20),),
                //   onPressed: () {_inserir();
                //   _consultar();},
                // ),
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
                                builder: (context) => TelaAcessibilidade()));
                        print(globais.Globais.acessibilidadeOn);
                      },
                      child: Text('Opções de acessibilidade'),
                    ),
                  ),
                )
              ]),
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
        ]))));
  }
}
