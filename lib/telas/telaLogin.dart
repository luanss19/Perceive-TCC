import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/telas/telaCadastro.dart';
import 'package:perceive/telas/telaInicial.dart';
import 'package:perceive/telas/telaRecuperacao.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();

  TextEditingController _LoginUserController = TextEditingController();
  TextEditingController _SenhaUserController = TextEditingController();

  String _Login = "usuario";
  String _senha = "1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text("PERCEIVE",
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 55)),
                  SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 5.0),
                          child: Text(
                            "Login",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 25),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
                          child: Text(
                            "Insira seus dados abaixo para efetuar seu login",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15),
                          )),
                    ),
                  ),
                  Form(
                    key: _chaveForm,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 15.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _LoginUserController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "E-mail",
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (texto) {
                              if (texto!.length < 1) {
                                return "Login em branco";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 5.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _SenhaUserController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Senha",
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            validator: (texto) {
                              if (texto!.length < 1) {
                                return "Senha em branco";
                              }
                              return null;
                            },
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaRecuperacao()));
                          },
                          child: SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: Container(
                                child: Padding(
                              padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                                  child: Text(
                                    'Esqueceu sua senha?',
                                    textAlign: TextAlign.left,
                                  ),
                            )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 40.0),
                          child: RaisedButton(
                              child: Text("Login"),
                              onPressed: () {
                                // //valida se os campos estão preenchidos
                                // if (_chaveForm.currentState.validate()) {
                                //   //verifica se é usuario padrão (admin) salvo na variavel
                                //   if (_SenhaUserController.text == _senha &&
                                //       _LoginUserController.text == _Login) {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TelaInicial()));
                                //   } else {
                                //     _alertImagem();
                                //   }
                                // }
                              }),
                        ),
                        SizedBox(
                          height: 75.0,
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
                      ],
                    ),
                  ),
    ])));
  }

  Future<void> _alertImagem() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Usuario ou senha inválidos"),
            content: Text("Verifique o usuario e senha e tente novamente  "),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
