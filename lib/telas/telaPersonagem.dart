import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/telas/telaInGame.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaPersonagem(),
  ));
}

class TelaPersonagem extends StatefulWidget {
  @override
  _TelaPersonagemState createState() => _TelaPersonagemState();
}

class _TelaPersonagemState extends State<TelaPersonagem> {
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey,
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
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text("Pontos de vida: 5/10",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Os pontos de vida representam a saúde do seu personagem e indicam o quão bem ele está.",
                      style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Ataque: 1",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Os pontos de atque do seu personagem representam quanto de dano ele dará por ataque a um inimigo.",style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Defesa: 2",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Os pontos de defesa do seu personagem representam quanto de dano ele não irá tomar por ataque de um inimigo.",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}