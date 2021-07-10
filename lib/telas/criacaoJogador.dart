import 'package:flutter/material.dart';
import 'package:perceive/dados/jogador.dart';

class criacaoJogador extends StatefulWidget {
  Jogador jogador;
  criacaoJogador({required this.jogador});

  @override
  _criacaoJogadorState createState() => _criacaoJogadorState();
}

class _criacaoJogadorState extends State<criacaoJogador> {
  late Jogador _jogadorTemporario;

  bool jogadorAlterado = false;

  TextEditingController _idController = TextEditingController();
  TextEditingController _historiaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _vidaController = TextEditingController();
  TextEditingController _ataqueController = TextEditingController();
  TextEditingController _defesaController = TextEditingController();
  TextEditingController _armaduraController = TextEditingController();
  TextEditingController _armaController = TextEditingController();
  TextEditingController _item1Controller = TextEditingController();
  TextEditingController _item2Controller = TextEditingController();
  TextEditingController _item3Controller = TextEditingController();

  @override
  void initState() {
    if (widget.jogador == null) {
      _jogadorTemporario = Jogador();
    } else {
      _jogadorTemporario = Jogador.fromMap(widget.jogador.toMap());

      _nomeController.text = _jogadorTemporario.nome;

      _jogadorTemporario.historia = 0;
      _jogadorTemporario.vida = 0;
      _jogadorTemporario.ataque = 0;
      _jogadorTemporario.defesa = 0;
      _jogadorTemporario.arma = 0;
      _jogadorTemporario.armadura = 0;
      _jogadorTemporario.item1 = 0;
      _jogadorTemporario.item2 = 0;
      _jogadorTemporario.item3 = 0;

      _historiaController.text = 0 as String;
      _vidaController.text = 10 as String;
      _ataqueController.text = 0 as String;
      _defesaController.text = 0 as String;
      _armaController.text = 0 as String;
      _armaduraController.text = 0 as String;;
      _item1Controller.text = 0 as String;
      _item2Controller.text = 0 as String;
      _item3Controller .text= 0 as String;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: alertaModificacoes,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Criação de Perfil de Salvamento"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            if (_jogadorTemporario.nome != null &&
                _jogadorTemporario.nome.isNotEmpty) {
              Navigator.pop(context, _jogadorTemporario);
            }
          },
        ),
        body: corpo(),
      ),
    );
  }

  Widget corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _nomeController,
            keyboardType: TextInputType.text,
            onChanged: (texto) {
              jogadorAlterado = true;
              setState(() {
                _jogadorTemporario.nome = texto;
              });
            },
            decoration: InputDecoration(
              labelText: "Nome",
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> alertaModificacoes() {
    if (jogadorAlterado) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar modificações?"),
              content: Text("Deseja sair sem modificar o jogador?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Não"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return Future.value(false);
    }
    else {
      return Future.value(true);
    }
  }
}
