import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/global.dart' as globais;

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

enum acessibilidadeController { ligado, desligado }

class _TelaAcessibilidadeState extends State<TelaAcessibilidade> {

  acessibilidadeController? _onOff = globais.acessibilidadeOn == true ? acessibilidadeController.ligado : acessibilidadeController.desligado;
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
                RadioListTile<acessibilidadeController>(
                  title: const Text('Ligado', style: TextStyle(fontSize: 15)),
                  value: acessibilidadeController.ligado,
                  groupValue: _onOff,
                  onChanged: (acessibilidadeController? value) {
                    setState(() {
                      _onOff = value;
                      check(_onOff!);
                    });
                  },
                ),
                RadioListTile<acessibilidadeController>(
                  title:
                      const Text('Desligado', style: TextStyle(fontSize: 15)),
                  value: acessibilidadeController.desligado,
                  groupValue: _onOff,
                  onChanged: (acessibilidadeController? value) {
                    setState(() {
                      _onOff = value;
                      check(_onOff!);
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

  check(acessibilidadeController _onOff){
    if(_onOff == acessibilidadeController.ligado){
      globais.acessibilidadeOn = true;
    }else if (_onOff == acessibilidadeController.desligado){
      globais.acessibilidadeOn = false;
    }
    print(globais.acessibilidadeOn);
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
