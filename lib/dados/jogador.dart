import 'package:perceive/dados/JogadorHelper.dart';

class Jogador {
  int id;
  String nome;
  int historia;
  int vida;
  int ataque;
  int defesa;
  int arma;
  int armadura;
  int item1;
  int item2;
  int item3;

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

  Map toMap() {
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