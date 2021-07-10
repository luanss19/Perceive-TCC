import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/dados/salvamento.dart';
import 'package:perceive/historia/cerebroHistoria.dart';
import 'package:perceive/telas/telaInicial.dart';
import 'package:perceive/telas/telaInventario.dart';
import 'package:perceive/telas/telaPersonagem.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaInGame(),
  ));
}

Salvamento _salvamento = new Salvamento();
cerebroHistoria _historia = new cerebroHistoria();

class TelaInGame extends StatefulWidget {
  @override
  _TelaInGameState createState() => _TelaInGameState();
}

class _TelaInGameState extends State<TelaInGame> {
  late Jogador jogador;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: barraSuperior(),
        bottomNavigationBar: barraInferior(),
        body: SingleChildScrollView(
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
                        child:
                        Text(_historia.historia.tituloHistoria,
                             style: TextStyle(fontSize: 15 ),)),
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
                              setState(() => _historia.proxHistoria(1));
                              _salvamento.salvar(jogador);
                            },
                            child:Text(_historia.historia.escolha1),

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
                              setState(() => _historia.proxHistoria(2));
                              _salvamento.salvar(jogador);
                            },
                            child: Text(_historia.historia.escolha2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: _historia.botaoVisivel2(),
                        child: ButtonTheme(
                          minWidth: 200.0,
                          child: RaisedButton(
                            color: Colors.grey,
                            onPressed: () {
                              setState(() => _historia.proxHistoria(3));
                              _salvamento.salvar(jogador);
                              print(_historia.numeroHistoria);
                            },
                            child: Text(_historia.historia.escolha3)
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            )
        )
    );
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
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                      width: 50,
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
                  "\$175",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              width: 150
            ),
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (contex) => TelaInicial()));
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
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contex) => TelaInventario()));},
            ),
          ),
          Expanded(
            flex: 5,
            child: OutlineButton(
                child: Text("Personagem", style: TextStyle(fontSize: 20)),
                onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => TelaPersonagem()));}),
          ),
        ],
      ),
    );
  }
}
