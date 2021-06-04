import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaAcessibilidade(),
  ));
}

class TelaAcessibilidade extends StatefulWidget {
  @override
  _TelaAcessibilidadeState createState() => _TelaAcessibilidadeState();
}

enum SingingCharacter { ligado, desligado }

class _TelaAcessibilidadeState extends State<TelaAcessibilidade> {
  SingingCharacter? _character = SingingCharacter.desligado;
  double _sliderMusica = 20;
  double _sliderNarracao = 50;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: barraSuperior(),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: 380,
                    child: Text(
                      "Modo de leitura de texto por sitetizador:",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 10,
                ),
                RadioListTile<SingingCharacter>(
                  title: const Text('Ligado', style: TextStyle(fontSize: 15)),
                  value: SingingCharacter.ligado,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<SingingCharacter>(
                  title:
                      const Text('Desligado', style: TextStyle(fontSize: 15)),
                  value: SingingCharacter.desligado,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: 380,
                    height: 35,
                    child: Text(
                      "Controle de Volume",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(width: 340, child: Text("Volume Narração")),
                Slider(
                    value: _sliderNarracao,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _sliderNarracao.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _sliderNarracao = value;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                SizedBox(width: 340, child: Text("Volume Música")),
                Slider(
                    value: _sliderMusica,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _sliderMusica.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _sliderMusica = value;
                      });
                    })
              ]),
        )));
  }

  barraSuperior() {
    return AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        shadowColor: null,
        title: Center(
          child: Text(
            "Opções de Acessibilidade",
            style: TextStyle(color: Colors.black),
          ),
        ));
  }
}
