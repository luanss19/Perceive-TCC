import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/dados/database.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:perceive/telas/telaInGame.dart';



class criacaoJogador extends StatefulWidget {

  @override
  _criacaoJogadorState createState() => _criacaoJogadorState();
}

class _criacaoJogadorState extends State<criacaoJogador> {

  final _formKey = GlobalKey<FormState>();
  Jogador _jogador = Jogador();
  Jogador _jogadorTemp = Jogador();
  List<Jogador> _jogadores = [];
  late DatabasePerceive _dbHelper ;
  final FlutterTts flutterTts = FlutterTts();

  @override

  void initState(){
    super.initState();
    setState(() {
      _dbHelper = DatabasePerceive.instance;
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
          RaisedButton(onPressed: (){
            _consultar();
          },
          child:Text('Listar')),
          RaisedButton(onPressed: (){
            _deletar();
          },
              child:Text('Deletar'))
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
      _jogador.ataque = 0;
      _jogador.defesa = 0;
      _jogador.dinheiro = 0;
      _jogador.arma = 0;
      _jogador.armadura = 0;
      _jogador.item1 = 0;
      _jogador.item2 = 0;
      _jogador.item3 = 0;
      form.save();
      var id = await _dbHelper.salvarJogador(_jogador);
      _jogadorTemp = await _dbHelper.ultimoRegistro();
      print (_jogadorTemp.id);
      globais.Globais.numPlayer = _jogadorTemp.id!;
      globais.Globais.numeroHistoria=0;
      globais.Globais.ultimoPlayer = _jogadorTemp.id!;
      print(globais.Globais.numPlayer);
      print(_jogador.id);
      form.reset();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TelaInGame(jogadorID: _jogadorTemp.id!,)));
    }

    }
  }