import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/database.dart';
import 'package:perceive/telas/telaAcessibilidade.dart';
import 'package:perceive/telas/telaCarregarJogo.dart';
import 'package:perceive/telas/telaCreditos.dart';
import 'package:perceive/telas/telaInGame.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:swipe/swipe.dart';
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
  final FlutterTts flutterTts = Get.find();
  final AssetsAudioPlayer musica = Get.find();

  int tela = 1;

  MaterialColor cor1 = Colors.green;
  MaterialColor cor2 = Colors.grey;
  MaterialColor cor3 = Colors.grey;
  MaterialColor cor4 = Colors.grey;

  @override
  void initState() {
    if (globais.Globais.musicaOn == true) {
      if(musica.isPlaying.value == true){

      }else{
        musica.open(Audio('assets/music/background.mp3'),
            showNotification: false, volume: 0.1, loopMode: LoopMode.single);
      }
    }

    setState(() {
      flutterTts.stop();
      if (globais.Globais.acessibilidadeOn == true) {
        flutterTts.speak(
            "A tela inicial contém quatro botões.  Primeiro: Novo Jogo.  Segundo: Continuar Jogo.  Terceiro: Carregar Salvo.  Quarto: Opções de Acessibilidade. "
                "Tutorial de Comandos: Deslizar o dedo no meio da tela para cima, vai para a tela de Créditos. "
                "Deslizar para a  esquerda e direita seleciona qual tela você quer ir. "
                "Segurar o dedo na tela seleciona a tela."
                "Deslizar para baixo repete o tutorial.");
      }
      _dbHelper = DatabasePerceive.instance;
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false, child: new Scaffold(body: tipoTela()));
  }

  tipoTela() {
    if (globais.Globais.acessibilidadeOn == true) {
      return InkWell(
          onLongPress: () {
        setState(() {
          switch (tela) {
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => criacaoJogador(),
              ));
              break;
            case 2:
              globais.Globais.restartdemo = false;
              if (globais.Globais.ultimoPlayer != 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaInGame(
                            jogadorID: globais.Globais.ultimoPlayer)));
              } else {
                if (globais.Globais.acessibilidadeOn == true) {
                  flutterTts.speak(
                      'Nenhum jogo foi carregado nessa sessão, inicie um novo jogo ou escolha um jogo salvo no menu Carregar Salvo');
                }
                final snackBar = SnackBar(
                    content: Text(
                        'Nenhum jogo foi carregado nessa sessão, inicie um novo jogo ou escolha um jogo salvo no menu Carregar Salvo'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => telaCarregarJogo()));
              break;
            case 4:
              Get.to(TelaAcessibilidade());
              print(globais.Globais.acessibilidadeOn);
              break;
          }
        });
      },
    child:Swipe(
          verticalMinVelocity: 100,
          horizontalMinVelocity: 100,
        onSwipeDown: () {
          flutterTts.stop();
          flutterTts.speak(
              "Tutorial de Comandos: Deslizar o dedo no meio da tela para baixo, vai para a tela de Créditos. Deslizar para a  esquerda e direita seleciona qual tela você quer ir. Segurar o dedo na tela seleciona a tela.");
        },
        onSwipeUp: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TelaCreditos()));

        },
          onSwipeRight: () {
            if(tela == 4){
              tela = 1;
            }else{
              tela++;
            }
            print(tela);
            switch(tela){
              case 1:
                setState(() {
                  flutterTts.speak("Novo Jogo");
                  cor1 = Colors.green;
                  cor2 = Colors.grey;
                  cor3 = Colors.grey;
                  cor4 = Colors.grey;

                });
                break;
            case 2:
              setState(() {
                flutterTts.speak("Continuar Jogo");
                cor1 = Colors.grey;
                cor2 = Colors.green;
                cor3 = Colors.grey;
                cor4 = Colors.grey;
              });
                break;
            case 3:
              setState(() {
                flutterTts.speak("Carregar Salvo");
                cor1 = Colors.grey;
                cor2 = Colors.grey;
                cor3 = Colors.green;
                cor4 = Colors.grey;
              });
                break;
            case 4:
              setState(() {
                flutterTts.speak("Opções de acessibilidade");
                print(tela);
                cor1 = Colors.grey;
                cor2 = Colors.grey;
                cor3 = Colors.grey;
                cor4 = Colors.green;
              });
              break;

            }
          },
        onSwipeLeft: () {
          if(tela == 1){
            tela = 4;
          }else{
            tela--;
          }
          print(tela);
          switch(tela){
            case 1:
              setState(() {
                flutterTts.speak("Novo Jogo");
                cor1 = Colors.green;
                cor2 = Colors.grey;
                cor3 = Colors.grey;
                cor4 = Colors.grey;

              });
              break;
            case 2:
              setState(() {
                flutterTts.speak("Continuar Jogo");
                cor1 = Colors.grey;
                cor2 = Colors.green;
                cor3 = Colors.grey;
                cor4 = Colors.grey;
              });
              break;
            case 3:
              setState(() {
                flutterTts.speak("Carregar Salvo");
                cor1 = Colors.grey;
                cor2 = Colors.grey;
                cor3 = Colors.green;
                cor4 = Colors.grey;
              });
              break;
            case 4:
              setState(() {
                flutterTts.speak("Opções de acessibilidade");
                print(tela);
                cor1 = Colors.grey;
                cor2 = Colors.grey;
                cor3 = Colors.grey;
                cor4 = Colors.green;
              });
              break;

          }
        },
          child: Container(
          height: MediaQuery.of(context).size.height,
    alignment: Alignment.topCenter,
    color: Colors.transparent,
    child:Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Text("PERCEIVE",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
        SizedBox(height: 120.0),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: 200.0,
              child: RaisedButton(
                disabledColor: cor1,

                onPressed: null,
                child: Text('Novo Jogo'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: 200.0,
              child: RaisedButton(
                disabledColor: cor2,
                onPressed: null,
                child: Text('Continuar Jogo'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: 200.0,
              child: RaisedButton(
                disabledColor: cor3,
                onPressed: null,
                child: Text('Carregar Salvo'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: 200.0,
              child: RaisedButton(
                disabledColor: cor4,
                onPressed: null,
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
              onPressed: () {
                if (globais.Globais.acessibilidadeOn == true) {
                  flutterTts.speak(
                      "Você está jogando uma versão Demo um ponto zero, espere por atualizações futuras.");
                }
                final snackBar = SnackBar(
                    content: Text(
                        'Você está jogando uma versão Demo (1.0), espere por atualizações futuras.'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('V1.0.'),
            ),
            SizedBox(
              width: 25.0,
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
                Get.to(TelaCreditos());
              },
              child: Text('Créditos'),
            ),
          ],
        )
      ]
          )
    )
          )
      ));
    } else {
      return Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Text("PERCEIVE",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
        SizedBox(height: 120.0),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
                  if (globais.Globais.ultimoPlayer != 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaInGame(
                                jogadorID: globais.Globais.ultimoPlayer)));
                  } else {
                    if (globais.Globais.acessibilidadeOn == true) {
                      flutterTts.speak(
                          'Nenhum jogo foi carregado nessa sessão, inicie um novo jogo ou escolha um jogo salvo no menu Carregar Salvo');
                    }
                    final snackBar = SnackBar(
                        content: Text(
                            'Nenhum jogo foi carregado nessa sessão, inicie um novo jogo ou escolha um jogo salvo no menu Carregar Salvo'));
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: 200.0,
              child: RaisedButton(
                color: Colors.grey,
                onPressed: () {
                  Get.to(TelaAcessibilidade());
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
              onPressed: () {
                if (globais.Globais.acessibilidadeOn == true) {
                  flutterTts.speak(
                      "Você está jogando uma versão Demo um ponto zero, espere por atualizações futuras.");
                }
                final snackBar = SnackBar(
                    content: Text(
                        'Você está jogando uma versão Demo (1.0), espere por atualizações futuras.'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('V1.0.'),
            ),
            SizedBox(
              width: 25.0,
              height: 20.0,
            ),
            FlatButton(
              onPressed: () {
                Get.to(TelaCreditos());
              },
              child: Text('Créditos'),
            ),
          ],
        )
      ]));
    }
  }
}
