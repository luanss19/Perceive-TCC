import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perceive/telas/telaInicial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaCreditos(),
  ));
}

class TelaCreditos extends StatefulWidget {
  @override
  _TelaCreditosState createState() => _TelaCreditosState();
}

class _TelaCreditosState extends State<TelaCreditos> {
  final FlutterTts flutterTts = FlutterTts();

  void initState() {
    super.initState();
    flutterTts.stop();
    setState(() {
      setState(() {
        if (globais.Globais.acessibilidadeOn == true) {
          flutterTts.speak(
              "A tela Créditos tem três campos de informação.   "
                  "Primeiro: Desenvolvimento do Aplicativo: Feito por Luan Silva da Silva.  "
                  "Segundo: Desenvolvimento da História: Feito por Luan Silva da Silva e Pietro Peres Duarte Mesquita da Silva. "
                  "Terceiro: Professor Orientador: João Júnior da Silva Machado...    "
                  "Deslize o dedo no meio da tela para cima para voltar para o menu inicial."
                  "Deslize o dedo para baixo repetir o tutorial.");
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(appBar: barraSuperior(), body: tipoTela()),
    );
  }

  barraSuperior() {
    return AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        shadowColor: null,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              flutterTts.stop();
              Get.back();
            }),
        title: Center(
          child: Text(
            "Contribuições ao Projeto Perceive",
            style: TextStyle(color: Colors.black),
          ),
        ));
  }

  tipoTela() {
    if (globais.Globais.acessibilidadeOn == true) {
      return Center(
          child: Swipe(
              verticalMinVelocity: 100,
              horizontalMinVelocity: 100,
              onSwipeUp: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TelaInicial()));
              },
              onSwipeDown: () {
                flutterTts.stop();
                flutterTts.speak(
                    "Tutorial de Comandos: Deslizar o dedo no meio da tela para cima, volta para o menu inicial. Deslizar o dedo para baixo repete o tutorial.");
              },
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Desenvolvimento do Aplicativo",
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                                child: Text('Luan Silva da Silva',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue)),
                                onTap: () =>
                                    launch('https://github.com/luanss19')),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Desenvolvimento da História",
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                                child: Text('Luan Silva da Silva',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue)),
                                onTap: () =>
                                    launch('https://github.com/luanss19')),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                                child: Text(
                                    'Pietro Peres Duarte Mesquita da Silva',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue)),
                                onTap: () => launch(
                                    'https://www.wattpad.com/user/PietroPeresDuarte')),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Professor Orientador",
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                                child: Text('João Júnior da Silva Machado',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue)),
                                onTap: () => launch(
                                    'http://lattes.cnpq.br/0061415619122233')),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))));
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Desenvolvimento do Aplicativo",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    child: Text('Luan Silva da Silva',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    onTap: () => launch('https://github.com/luanss19')),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Desenvolvimento da História",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    child: Text('Luan Silva da Silva',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    onTap: () => launch('https://github.com/luanss19')),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                    child: Text('Pietro Peres Duarte Mesquita da Silva',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    onTap: () => launch(
                        'https://www.wattpad.com/user/PietroPeresDuarte')),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Professor Orientador",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    child: Text('João Júnior da Silva Machado',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    onTap: () =>
                        launch('http://lattes.cnpq.br/0061415619122233')),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
