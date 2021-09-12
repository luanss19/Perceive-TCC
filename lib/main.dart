//import 'package:perceive/telas/telaCadastro.dart';
//import 'package:perceive/telas/telaLogin.dart';
import 'package:perceive/telas/telaInicial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/dados/global.dart' as globais;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    title: 'Perceive',
    theme: ThemeData(primaryColor: Colors.grey,visualDensity: VisualDensity.adaptivePlatformDensity),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver{
  final FlutterTts flutterTts = FlutterTts();
  final AssetsAudioPlayer musica = Get.put(AssetsAudioPlayer());

  @override

  void initState(){
    setState(() {
      _falaInicial();});
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      musica.play();
    } else {
      musica.pause();
    }
  }


  Widget build(BuildContext context) {

    return Scaffold(body: InkWell(
      onTap: (){
        globais.Globais.acessibilidadeOn = false;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelaInicial()));
      },
      onDoubleTap: (){
        globais.Globais.acessibilidadeOn = true;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelaInicial()));
      },
      child: Container(
        color: Colors.black,
      ),
    ),
    //     body: Center(
    //         child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    //             SizedBox(
    //               height: 50.0,
    //             ),
    //             Text("PERCEIVE",
    //                 textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
    //             SizedBox(
    //               width: 200.0,
    //               height: 200.0,
    //             ),
    //             Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    //               FlatButton(
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context, MaterialPageRoute(builder: (contex) => telaCadastro()));
    //                   },
    //                 child: Text('Criar Conta'),
    //               ),
    //               FlatButton(
    //                 onPressed: () {
    //                   Navigator.push(
    //                       context, MaterialPageRoute(builder: (contex) => Login()));
    //                 },
    //                 child: Text('Login'),
    //               ),
    //             ]),
    //             SizedBox(
    //               width: 200.0,
    //               height: 225.0,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 FlatButton(
    //                   onPressed: () {},
    //                   child: Text('V1.0.'),
    //                 ),
    //                 SizedBox(
    //                   width: 25.0,
    //                   height: 20.0,
    //                 ),
    //                 FlatButton(
    //                   onPressed: () {},
    //                   child: Text('Créditos'),
    //                 ),
    //               ],
    //             )
    // ]))
        );
  }
  _falaInicial() async{
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.speak("Bem vindo ao Perceive, dê um toque na tela para iniciar o jogo com a leitura de tela desativada.   Dois toques na tela para iniciar com a leitura ativada.");

  }
}


