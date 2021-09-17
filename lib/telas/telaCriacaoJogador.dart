import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/database.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:perceive/telas/telaInGame.dart';
import 'package:perceive/telas/telaInicial.dart';
import 'package:swipe/swipe.dart';


class criacaoJogador extends StatefulWidget {

  @override
  _criacaoJogadorState createState() => _criacaoJogadorState();
}

class _criacaoJogadorState extends State<criacaoJogador> {

  final _formKey = GlobalKey<FormState>();
  Jogador _jogador = Jogador();
  Jogador _jogadorTemp = Jogador();
  late DatabasePerceive _dbHelper ;
  final FlutterTts flutterTts = FlutterTts();

  @override

  void initState(){
    flutterTts.stop();
    super.initState();
    setState(() {
      _dbHelper = DatabasePerceive.instance;
      if (globais.Globais.acessibilidadeOn == true) {
        flutterTts.speak(
            "A tela de criação de jogo tem um campo para a inserção do nome do seu novo personagem e um botão escrito Iniciar Aventura.");
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criação de Perfil de Jogador"),
          backgroundColor: Colors.grey,
        ),
        body: corpo(),

    );
  }

  Widget corpo() {
    if (globais.Globais.acessibilidadeOn == true) {
      return Center(
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
                      "Tutorial de Comandos: Deslizar o dedo no meio da tela para a direita, vai para a tela de inventário. Deslizar para a  esquerda vai para a tela de Personagem. Delizar para cima Volta ao menu principal.");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  child: Column(
                    children: <Widget>[
                      Text("PERCEIVE",
                          textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
                      SizedBox(
                          height: 120.0
                      ),
                      _form(),
                    ],
                  ),
                ),
              ));
    } else {
      return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text("PERCEIVE",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
            SizedBox(
                height: 120.0
            ),
            _form(),
          ],
        ),
      );
    }
  }


  _form() => Container(
    color: Colors.white,
    padding:  EdgeInsets.symmetric(vertical: 15,horizontal: 30),
    child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onSaved: (val) => setState(() => _jogador.nome = val),
            decoration: InputDecoration(
                labelText: 'Nome do Jogador',
                labelStyle: TextStyle(
                  color: Colors.black,),
                fillColor: Colors.grey,
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey
                  ))
            ),
            validator: (val)=>(val!.length ==0 ? 'Preencha este campo':null),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: (){_start();},
              child: Text('Iniciar Aventura'),

            ),
          ),
        ],
      ),
    ),
  );

  void _deletar() async {
      await _dbHelper.droptable();

  }

  void _consultar() async {
    final todasLinhas = await _dbHelper.listarJogadores();
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
    print(globais.Globais.numPlayer);

  }
  _start() async {
    var form = _formKey.currentState;
    if (form!.validate()) {

      _jogador.historia = 0;
      _jogador.vida = 10;
      _jogador.ataque = 1;
      _jogador.defesa = 0;
      _jogador.dinheiro = 75;
      _jogador.arma = 1;
      _jogador.armadura = 0;
      _jogador.item1 = 0;
      _jogador.item2 = 0;
      _jogador.item3 = 0;
      form.save();
      var id = await _dbHelper.salvarJogador(_jogador);
      _jogadorTemp = await _dbHelper.ultimoRegistro();
      globais.Globais.numPlayer = _jogadorTemp.id!;
      globais.Globais.nomePlayer = _jogadorTemp.nome!;
      globais.Globais.numeroHistoria=0;
      globais.Globais.ultimoPlayer = _jogadorTemp.id!;
      form.reset();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TelaInGame(jogadorID: _jogadorTemp.id!,)));
    }

    }
  }