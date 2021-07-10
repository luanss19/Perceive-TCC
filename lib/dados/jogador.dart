import 'package:perceive/dados/salvamento.dart';

class Jogador {
 late int id;
 late String nome;
 late int historia;
 late int vida;
 late int ataque;
 late int defesa;
 late int arma;
 late int armadura;
 late int item1;
 late int item2;
 late int item3;

  Jogador();

  Jogador.fromMap(Map map) {
    id =      map[colunaId];
    nome =    map[colunaNome];
    historia = map[colunaHistoria];
    vida =    map[colunaVida];
    ataque =  map[colunaAtaque];
    defesa =  map[colunaDefesa];
    arma =    map[colunaArma];
    armadura =map[colunaArmadura];
    item1 =   map[colunaItem1];
    item2 =   map[colunaItem2];
    item3 =   map[colunaItem3];
  }

  toMap() {
    Map<String, dynamic> map = {
      colunaId: id,
      colunaNome: nome,
      colunaHistoria: historia,
      colunaVida: vida,
      colunaAtaque:ataque,
      colunaDefesa:defesa,
      colunaArma:arma,
      colunaArmadura:armadura,
      colunaItem1:item1,
      colunaItem2:item2,
      colunaItem3:item3,
    };
    if (id != null) {
      map[colunaId] = id;
    }
    return map;
  }

  @override
  String toString() {
    return ("Jogador(id: $id | "
        "nome: $nome | "
        "vida: $vida | "
        "historia: $historia | "
        "ataque: $ataque | "
        "defesa: $defesa | "
        "arma: $arma | "
        "armadura: $armadura | "
        "item1: $item1 | "
        "item2: $item2 | "
        "item3: $item3 | ");
  }

}