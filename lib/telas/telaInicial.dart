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

import 'criacaoJogador.dart';

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

  Jogador _jogador = Jogador();
  late DatabasePerceive _dbHelper ;
  final FlutterTts flutterTts = FlutterTts();

  @override

  void initState(){
    super.initState();
    setState(() {
      _dbHelper = DatabasePerceive.instance;
    });
  }

  Widget build(BuildContext context) {
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => criacaoJogador(),
                          ));
                          setState(() {
                            //globais.Globais.numeroHistoria = 0;
                            //globais.Globais.restartdemo = false;

                          });

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
                              builder: (contex) => telaCarregarJogo()));
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
                    child:RaisedButton(
                      color: Colors.grey,
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => TelaAcessibilidade()));
                      print(globais.Globais.acessibilidadeOn);
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
  // _criacaoJogador({required Jogador jogador}) async {
  //   final jogadorRetornado = await Navigator.push(context,
  //       MaterialPageRoute(builder: (contxt) => criacaoJogador(jogador: jogador)));
  //
  //   if(jogadorRetornado != null) {
  //     if(jogador != null) {
  //       await salvamento.atualizarJogador(jogadorRetornado);
  //     }
  //     else {
  //       await salvamento.salvar(jogadorRetornado);
  //     }
  //   }
  // }

  // void _inserir() async {
  //   // linha para incluir
  //   Map<String, dynamic> row = {
  //     DatabasePerceive.colunaId: 1,
  //     DatabasePerceive.colunaNome   : "Luan",
  //     DatabasePerceive.colunaHistoria  : 1,
  //     DatabasePerceive.colunaVida   : 1,
  //     DatabasePerceive.colunaAtaque  : 1,
  //     DatabasePerceive.colunaDefesa  : 1,
  //     DatabasePerceive.colunaArma : 1,
  //     DatabasePerceive.colunaArmadura  : 1,
  //   };
  //   final id = await dbHelper.insert(row);
  //   print('linha inserida id: $id');
  // }
  // void _consultar() async {
  //   final todasLinhas = await dbHelper.queryAllRows();
  //   print('Consulta todas as linhas:');
  //   todasLinhas.forEach((row) => print(row));
  // }
}


