import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/telas/telaInGame.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
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
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => TelaInGame()));
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 10,
                  width: 150,
                )
                ),
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
                    Text("Espaço de arma 1:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Espada",style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Espaço de arma 2:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Cajado",style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Espaço de arma 3:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Vazio",style: TextStyle(fontSize: 20),),
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
                    Text("Espaço de armadura 1:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Colete de couro",style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Espaço de armadura 2:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Vazio",style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Espaço de armadura 3:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Vazio",style: TextStyle(fontSize: 20),),
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
                    Text("Espaço de item 1:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Pedaço de mapa",style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Espaço de item 2:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Carta",style: TextStyle(fontSize: 20),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Espaço de item 3:",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Vazio",style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}