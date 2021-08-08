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
          itemBuilder: (context,index){
            return _cardJogador(context,index);
          },
          itemCount: _jogadores.length,
        )
    );
  }

  Widget corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Text("PERCEIVE",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
          SizedBox(
              height: 120.0
          ),
          Card(
            margin:  EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemBuilder: (context,index){
                return Column(
                  children: <Widget> [
                    ListTile(
                      leading: Icon(Icons.person,
                          color: Colors.grey,
                          size: 40.0),
                      title: Text(_jogadores[index].nome!),
                    ),
                    Divider(
                      height: 5,
                    )
                  ],
                );
              },
              itemCount: _jogadores.length,
            ),
          )
        ],
      ),
    );
  }




  Widget _cardJogador(BuildContext contex, int index) {
    return GestureDetector(
      onTap: (){
        _carregarGame(jogador: _jogador);
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
//                  RaisedButton(
//                    child: Text("Editar"),
//                    onPressed: () {
//                      _navCriarAlterar(jogador: jogadores[index]);
//                    },
//                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _carregarGame({required Jogador jogador}) {
    globais.Globais.numeroHistoria = jogador.historia!;
    globais.Globais.numPlayer = jogador.id!;
    globais.Globais.restartdemo = false;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contex) => TelaInGame()));
  }






}

