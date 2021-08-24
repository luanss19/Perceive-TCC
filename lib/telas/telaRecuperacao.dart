import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perceive/telas/telaCadastro.dart';

void main() {
  runApp(MaterialApp(
    title: 'Perceive',
    home: TelaRecuperacao(),
  ));
}

class TelaRecuperacao extends StatefulWidget {
  @override
  _TelaRecuperacaoState createState() => _TelaRecuperacaoState();
}

class _TelaRecuperacaoState extends State<TelaRecuperacao> {
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();

  TextEditingController _emailUserController = TextEditingController();

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
                        "Recuperação de senha",
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
                        "Insira seu e-mail abaixo para receber sua senha",
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
                      padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _emailUserController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        validator: (texto) {
                          if (texto!.length < 1) {
                            return "E-mail em branco";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 40.0),
                      child: RaisedButton(
                          child: Text("Recuperar Senha"),
                          onPressed: () {
                            //valida se os campos estão preenchidos
                            if (_chaveForm.currentState!.validate()) {
                              //verifica se é usuario padrão (admin) salvo na variavel
                              if (_emailUserController.text == null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => telaCadastro()));
                              } else {
                                _alertImagem();
                              }
                            }
                          }),
                    ),
                    SizedBox(
                      height: 195.0,
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
            title: Text("E-mail inválido"),
            content: Text("Verifique seu e-mail e tente novamente  "),
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
