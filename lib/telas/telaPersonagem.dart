import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/database.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:perceive/telas/telaInGame.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:flutter_tts/flutter_tts.dart';

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

  late Jogador _jogador ;
  late DatabasePerceive _dbHelper ;

  final FlutterTts flutterTts = FlutterTts();

  void initState() {
    super.initState();
    flutterTts.stop();
    setState(() {

      _dbHelper = DatabasePerceive.instance;
      refreshJogadores().whenComplete((){
        setState(() {
          if (globais.Globais.acessibilidadeOn == true) {
          flutterTts.speak(
              "A tela Personagem contém três campos de informação.  "
                  "Primeiro: Pontos de vida: ${_jogador.vida} de 10.Os pontos de vida representam a saúde do seu personagem e indicam o quão bem ele está.  "
                  "Segundo: Ataque: ${_jogador.ataque}.Os pontos de ataque do seu personagem representam quanto de dano ele dará por ataque a um inimigo.  "
                  "Terceiro: Defesa: ${_jogador.defesa}.Os pontos de defesa do seu personagem representam quanto de dano ele não irá tomar por ataque de um inimigo");
        }});
      });
    });
  }

  Future refreshJogadores() async {
    this._jogador = await _dbHelper.carregar(globais.Globais.ultimoPlayer);
    globais.Globais.ultimoPlayer = _jogador.id!;
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body:  Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey,
            title: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                flutterTts.stop();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => TelaInGame()));
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
                    Text("Pontos de vida: ${_jogador.vida}/10",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Os pontos de vida representam a saúde do seu personagem e indicam o quão bem ele está.",
                      style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Ataque: ${_jogador.ataque}",style: TextStyle(fontSize: 25),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Os pontos de ataque do seu personagem representam quanto de dano ele dará por ataque a um inimigo.",style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Defesa: ${_jogador.defesa}",style: TextStyle(fontSize: 25),),
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