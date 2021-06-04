import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/telas/telaInventario.dart';
import 'package:perceive/telas/telaPersonagem.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaInGame(),
  ));
}

class TelaInGame extends StatefulWidget {
  @override
  _TelaInGameState createState() => _TelaInGameState();
}

class _TelaInGameState extends State<TelaInGame> {
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
                        Text("Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração Narração ",
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
                          onPressed: () {},
                          child: Text('Opção 1'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        child: RaisedButton(
                          color: Colors.grey,
                          onPressed: () {},
                          child: Text('Opção 2'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        child: RaisedButton(
                          color: Colors.grey,
                          onPressed: () {},
                          child: Text('Opção 3'),
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
      title: Row(
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
            width: 190,
          ),
          GestureDetector(
            child: Icon(
              Icons.pause,
              color: Colors.black,
            ),
          ),
        ],
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
