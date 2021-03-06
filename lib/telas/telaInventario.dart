import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/database.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/telas/telaInGame.dart';
import 'package:swipe/swipe.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaInventario(),
  ));
}

class TelaInventario extends StatefulWidget {
  @override
  _TelaInventarioState createState() => _TelaInventarioState();
}

class _TelaInventarioState extends State<TelaInventario> {
  late Jogador _jogador;
  late DatabasePerceive _dbHelper;

  final FlutterTts flutterTts = FlutterTts();

  void initState() {
    super.initState();
    flutterTts.stop();
    setState(() {
      _dbHelper = DatabasePerceive.instance;
      refreshJogadores().whenComplete(() {
        setState(() {
          if (globais.Globais.acessibilidadeOn == true) {
            flutterTts.speak(
                "A tela Inventário contém três campos de informação.  "
                "Primeiro: Armas: Você tem uma  Espada:um de ataque.  "
                "Segundo: Armaduras: Você tem um  Colete de Couro:zero de defesa.  "
                "Terceiro: Itens: Todos os espaços estão vazios."
                "Deslize o dedo para cima para voltar a tela de jogo.");
          }
        });
      });
    });
  }

  Future refreshJogadores() async {
    this._jogador = await _dbHelper.carregar(globais.Globais.ultimoPlayer);
    globais.Globais.ultimoPlayer = _jogador.id!;
  }

  Widget build(BuildContext context) {
    return Scaffold(body: tipoTela());
  }

  tipoTela() {
    if (globais.Globais.acessibilidadeOn == true) {
      return Center(
          child: Swipe(
        verticalMinVelocity: 100,
        horizontalMinVelocity: 100,
        onSwipeUp: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TelaInGame(jogadorID: _jogador.id!)));
        },
        onSwipeDown: () {
          flutterTts.stop();
          flutterTts.speak(
              "Tutorial de Comandos: Deslizar o dedo para cima Volta ao jogo. Deslizar para baixo repete o tutorial.");
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          color: Colors.transparent,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.grey,
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Armas"),
                    Tab(text: "Armaduras"),
                    Tab(text: "Itens"),
                  ],
                ),
                title: GestureDetector(
                  onTap: () {
                    flutterTts.stop();
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        height: 10,
                        width: 150,
                      )),
                ),
              ),
              body: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de arma 1:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Espada (+1)",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de arma 2:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vazio",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de arma 3:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vazio",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de armadura 1:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Colete de couro (+0)",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de armadura 2:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vazio",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de armadura 3:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vazio",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de item 1:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vazio",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de item 2:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vazio",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Espaço de item 3:",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vazio",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    } else {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey,
            bottom: TabBar(
              tabs: [
                Tab(text: "Armas"),
                Tab(text: "Armaduras"),
                Tab(text: "Itens"),
              ],
            ),
            title: GestureDetector(
              onTap: () {
                flutterTts.stop();
                Navigator.pop(context);
              },
              child: Center(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                height: 10,
                width: 150,
              )),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de arma 1:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Espada (+1)",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de arma 2:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vazio",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de arma 3:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vazio",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de armadura 1:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Colete de couro (+0)",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de armadura 2:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vazio",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de armadura 3:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vazio",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de item 1:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vazio",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de item 2:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vazio",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Espaço de item 3:",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vazio",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
