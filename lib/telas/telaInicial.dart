import 'package:perceive/telas/telaAcessibilidade.dart';
import 'package:perceive/telas/telaCadastro.dart';
import 'package:perceive/telas/telaInGame.dart';
import 'package:perceive/telas/telaLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaInicial(),
  ));
}

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (contex) => TelaInGame()));
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
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => TelaInGame()));
                      },
                      child: Text('Continuar'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => TelaInGame()));
                      },
                      child: Text('Carregar Salvo'),
                    ),
                  ),
                ),
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

}
