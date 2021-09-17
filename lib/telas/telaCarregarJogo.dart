import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/database.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:perceive/telas/telaInGame.dart';

class telaCarregarJogo extends StatefulWidget {

  @override
  _telaCarregarJogoState createState() => _telaCarregarJogoState();
}

class _telaCarregarJogoState extends State<telaCarregarJogo> {

  Jogador _jogador = Jogador();
  List<Jogador> _jogadores = [];
  late DatabasePerceive _dbHelper ;
  final FlutterTts flutterTts = FlutterTts();

@override
  void initState(){
  flutterTts.stop();
    super.initState();
    setState(() {
      _dbHelper = DatabasePerceive.instance;
    });
    listarJogadores();
  }

  void listarJogadores() {
    _dbHelper.listarJogadores().then((lista){
      setState(() {
        _jogadores = lista;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Jogos Salvos"),
          backgroundColor: Colors.grey,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: _jogadores.length,
          itemBuilder: (context,index){
            return _cardJogador(context,index);
          },
        )
    );
  }
  Widget _cardJogador(BuildContext context, int index) {
    return GestureDetector(
      onTap: () async{
        globais.Globais.numeroHistoria = _jogadores[index].historia!;
        globais.Globais.nomePlayer = _jogadores[index].nome!;
        globais.Globais.numPlayer = _jogadores[index].id!;
        globais.Globais.ultimoPlayer = _jogadores[index].id!;
        globais.Globais.restartdemo = false;
        await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => TelaInGame(jogadorID: _jogadores[index].id!)));
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Icon(Icons.person,size: 40,color: Colors.grey),
              SizedBox(
                width: 10,
              ),
              Column(
                children: <Widget>[
                  Text("Jogo Salvo ${index+1}",
                    style: TextStyle(fontSize: 25),),
                  Text(_jogadores[index].nome!,
                    style: TextStyle(fontSize: 10),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


