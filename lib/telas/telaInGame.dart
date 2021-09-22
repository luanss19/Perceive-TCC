import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/database.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/historia/cerebroHistoria.dart';
import 'package:perceive/historia/historia.dart';
import 'package:perceive/telas/telaInicial.dart';
import 'package:perceive/telas/telaInventario.dart';
import 'package:perceive/telas/telaPersonagem.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:swipe/swipe.dart';

cerebroHistoria _historia = new cerebroHistoria();

class TelaInGame extends StatefulWidget {
  final int jogadorID;

  const TelaInGame({
    Key? key,
    required this.jogadorID,
  }) : super(key: key);
  @override
  _TelaInGameState createState() => _TelaInGameState();
}

class _TelaInGameState extends State<TelaInGame> {
  late Jogador _jogador;
  late DatabasePerceive _dbHelper;

  final FlutterTts flutterTts = FlutterTts();

  void initState() {
    super.initState();
    flutterTts.stop();
    setState(() {
      _dbHelper = DatabasePerceive.instance;
      refreshJogadores().whenComplete(() {
        setState(() {});
      });
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) => lerHistoria(
        _historia.historia.tituloHistoria,
        _historia.historia.escolha1,
        _historia.historia.escolha2));
  }

  Future refreshJogadores() async {
    this._jogador = await _dbHelper.carregar(widget.jogadorID);
    globais.Globais.ultimoPlayer = _jogador.id!;
    globais.Globais.nomePlayer = _jogador.nome!;
    _historia.dadosHistoria[4] = Historia(
        tituloHistoria:
            ' ${_jogador.nome}, você faz parte de um grupo investigativo contratado por nobres que eram antigos '
            'aliados do rei, seu objetivo é descobrir o que causou a morte de ambos Rei e Rainha.',
        escolha1: 'Próximo');
    _historia.dadosHistoria[9] = Historia(
        tituloHistoria:
            'Após bater na porta dos fundos algumas vezes e não ter nenhuma resposta, ${_jogador.nome} '
            'decidiu voltar no próximo dia. Percebendo que estava na mira dos investigadores reais, o dono da peculiar casa do subúrbio '
            'de Melenor fugiu para uma das cidades rurais do Reino, levando consigo as únicas informações que ajudariam você a completar sua missão.',
        escolha1: 'Fim do jogo. Você não alcançou seu objetivo.');
    _historia.dadosHistoria[26] = Historia(
        tituloHistoria:
            ' ${_jogador.nome} observa atentamente essas novas informações, e sem trocar muitas palavras parte em '
            'direção aos portões da cidade. Com cada vez mais determinação em desvendar os mistérios que envolvem este assassinato.',
        escolha1: 'Final 1 de 3 da demo. Jogue mais para descobrir os outros.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: barraSuperior(),
        bottomNavigationBar: barraInferior(),
        body: tipoTela());
  }

  lerHistoria(String narracao, String escolha1, String escolha2) async {
    if (globais.Globais.acessibilidadeOn == true) {
      await flutterTts.setVolume(globais.Globais.volumeTTS);
      if (_historia.eNarracao == true) {
        await flutterTts.speak(narracao + "...Escolha 1 :..." + escolha1);
      } else {
        await flutterTts.speak(narracao +
            "... Escolha 1 : ..." +
            escolha1 +
            "... Escolha 2 : ..." +
            escolha2);
      }
      if (globais.Globais.restartdemo == true) {
        await flutterTts.stop();
      }
    } else if (globais.Globais.acessibilidadeOn == false) {}
  }

  barraSuperior() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      shadowColor: null,
      title: Container(
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.white,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vida",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, spreadRadius: 3)
                          ]),
                      height: 10,
                      width: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      height: 10,
                      width: _jogador.vida! * 10,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  "Ouro",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "\$ ${_jogador.dinheiro}",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            SizedBox(width: 150),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaInicial()));
              },
              child: Icon(
                Icons.pause,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  barraInferior() {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: OutlineButton(
              child: Text(
                "Inventário",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaInventario()));
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: OutlineButton(
                child: Text("Personagem", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TelaPersonagem()));
                }),
          ),
        ],
      ),
    );
  }

  tipoTela() {
    if (globais.Globais.acessibilidadeOn == true) {
      return InkWell(
          onLongPress: () {
            setState(() {
              globais.Globais.ultimoPlayer = _jogador.id!;
              _historia.proxHistoria(1, _jogador);
              updateHistoria();
              print(_historia.historia.tituloHistoria +
                  _historia.historia.escolha1 +
                  _historia.historia.escolha2);
              lerHistoria(_historia.historia.tituloHistoria,
                  _historia.historia.escolha1, _historia.historia.escolha2);
            });
          },
          onDoubleTap: () {
            if (_historia.eNarracao == false) {
              setState(() {
                globais.Globais.ultimoPlayer = _jogador.id!;
                _historia.proxHistoria(2, _jogador);
                updateHistoria();
                print(_historia.historia.tituloHistoria +
                    _historia.historia.escolha1 +
                    _historia.historia.escolha2);
                lerHistoria(_historia.historia.tituloHistoria,
                    _historia.historia.escolha1, _historia.historia.escolha2);
              });
            }
          },
          child: Center(
              child: Swipe(
                verticalMinVelocity: 100,
                horizontalMinVelocity: 100,
              onSwipeUp: () {
                  Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TelaInicial()));
              },
              onSwipeDown: () {
              flutterTts.stop();
              flutterTts.speak(
                  "Tutorial de Comandos: Pressionar o dedo na tela por alguns segundos seleciona a escolha um. Dar dois toques na tela seleciona a escolha dois. Deslizar o dedo no meio da tela para a direita, vai para a tela de inventário. Deslizar para a  esquerda vai para a tela de Personagem. Delizar para cima Volta ao menu principal.");
              },
              onSwipeLeft: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TelaPersonagem()));
              },
              onSwipeRight: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TelaInventario()));
              },
              child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 350,
                        child: Text(
                          _historia.historia.tituloHistoria,
                          style: TextStyle(fontSize: 15),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        child: RaisedButton(
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              globais.Globais.ultimoPlayer = _jogador.id!;
                              _historia.proxHistoria(1, _jogador);
                              updateHistoria();
                              print(_historia.historia.tituloHistoria +
                                  _historia.historia.escolha1 +
                                  _historia.historia.escolha2);
                              lerHistoria(
                                  _historia.historia.tituloHistoria,
                                  _historia.historia.escolha1,
                                  _historia.historia.escolha2);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_historia.historia.escolha1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: _historia.botaoVisivel(),
                        child: ButtonTheme(
                          minWidth: 200.0,
                          child: RaisedButton(
                            color: Colors.grey,
                            onPressed: () {
                              setState(() {
                                globais.Globais.ultimoPlayer = _jogador.id!;
                                _historia.proxHistoria(2, _jogador);
                                updateHistoria();
                                print(_historia.historia.tituloHistoria +
                                    _historia.historia.escolha1 +
                                    _historia.historia.escolha2);
                                lerHistoria(
                                    _historia.historia.tituloHistoria,
                                    _historia.historia.escolha1,
                                    _historia.historia.escolha2);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(_historia.historia.escolha2),
                            ),
                          ),
                        ),
                      ),
                    ), //terceiro botão estava aqui
                  ]),
            ),
          )));
    } else {
      return SingleChildScrollView(
          child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 350,
                  child: Text(
                    _historia.historia.tituloHistoria,
                    style: TextStyle(fontSize: 15),
                  )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  child: RaisedButton(
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        globais.Globais.ultimoPlayer = _jogador.id!;
                        _historia.proxHistoria(1, _jogador);
                        updateHistoria();
                        print(_historia.historia.tituloHistoria +
                            _historia.historia.escolha1 +
                            _historia.historia.escolha2);
                        lerHistoria(
                            _historia.historia.tituloHistoria,
                            _historia.historia.escolha1,
                            _historia.historia.escolha2);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_historia.historia.escolha1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: _historia.botaoVisivel(),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {
                        setState(() {
                          globais.Globais.ultimoPlayer = _jogador.id!;
                          _historia.proxHistoria(2, _jogador);
                          updateHistoria();
                          print(_historia.historia.tituloHistoria +
                              _historia.historia.escolha1 +
                              _historia.historia.escolha2);
                          lerHistoria(
                              _historia.historia.tituloHistoria,
                              _historia.historia.escolha1,
                              _historia.historia.escolha2);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_historia.historia.escolha2),
                      ),
                    ),
                  ),
                ),
              ) //terceiro botão estava aqui
            ]),
      ));
    }
  }

  Future updateHistoria() async {
    await _dbHelper.updateHistoria(
        _jogador.id!, globais.Globais.numeroHistoria);
    final todasLinhas = await _dbHelper.listarJogadores();
    await refreshJogadores();
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
    print(_jogador.id);
    print(_jogador.historia);
    print(globais.Globais.acessibilidadeOn);

    globais.Globais.ultimoPlayer = _jogador.id!;
  }
}
