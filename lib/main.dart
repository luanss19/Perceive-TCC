import 'package:perceive/telas/telaCadastro.dart';
import 'package:perceive/telas/telaLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

void main() {
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

class _HomeState extends State<Home> {
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
                  width: 200.0,
                  height: 200.0,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (contex) => telaCadastro()));
                      },
                    child: Text('Criar Conta'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (contex) => Login()));
                    },
                    child: Text('Login'),
                  ),
                ]),
                SizedBox(
                  width: 200.0,
                  height: 225.0,
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
