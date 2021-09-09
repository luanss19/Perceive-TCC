import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:assets_audio_player/assets_audio_player.dart';

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

  acessibilidadeController? _onOff = globais.Globais.acessibilidadeOn == true ? acessibilidadeController.ligado : acessibilidadeController.desligado;
  double _sliderMusica = globais.Globais.volumeMusica*100;
  double _sliderNarracao = globais.Globais.volumeTTS*100;
  final AssetsAudioPlayer musica = Get.find();


  final FlutterTts flutterTts = FlutterTts();

  @override

  void initState(){
    flutterTts.stop();
    if (globais.Globais.acessibilidadeOn == true) {
      flutterTts.speak(
          "A tela de configurações de acessibilidade contém três opções.  Primeira: Alterar o modo de leitura de texto por voz entre ligade e desligado.  Segunda: Controle de Volume do Narrador.  Terceiro: Controle de Volume da música.");
    }
    super.initState();

  }

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
                      checkAcessibilidade(_onOff!);
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
                      checkAcessibilidade(_onOff!);
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
                        checkVolume(_sliderNarracao);
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
                        checkVolumeM(_sliderMusica);
                      });
                    })
              ]),
        )));
  }

  checkVolume(double volume){
    globais.Globais.volumeTTS = volume/100;
  }

  checkVolumeM(double volume){
    globais.Globais.volumeMusica = volume/100;
    setState(() {
      musica.setVolume(globais.Globais.volumeMusica);
    });
  }

  checkAcessibilidade(acessibilidadeController _onOff){
    if(_onOff == acessibilidadeController.ligado){
      globais.Globais.acessibilidadeOn = true;
    }else if (_onOff == acessibilidadeController.desligado){
      globais.Globais.acessibilidadeOn = false;
    }
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
          Get.back();}
            ),
        title: Center(
          child: Text(
            "Opções de Acessibilidade",
            style: TextStyle(color: Colors.black),
          ),
        ));
  }
}
