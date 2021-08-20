import 'package:perceive/dados/database.dart';
class Jogador {


  static const String tabelaJogador = "jogadores";

  static const String colunaId = "id";
  static const String colunaHistoria = "historia";
  static const String colunaNome = "nome";
  static const String colunaVida = "vida";
  static const String colunaAtaque = "ataque";
  static const String colunaDefesa = "defesa";
  static const String colunaDinheiro = "dinheiro";
  static const String colunaArma = "arma";
  static const String colunaArmadura = "armadura";
  static const String colunaItem1 = "item1";
  static const String colunaItem2 = "item2";
  static const String colunaItem3 = "item3";

  Jogador({
    this.id,
    this.nome,
    this.historia,
    this.ataque,
    this.defesa,
    this.dinheiro,
    this.arma,
    this.armadura,
    this.item1,
    this.item2,
    this.item3,
  });

  int? id;
  String? nome;
  int? historia;
  int? vida;
  int? ataque;
  int? defesa;
  int? dinheiro;
  int? arma;
  int? armadura;
  int? item1;
  int? item2;
  int? item3;


 // Jogador() {
 //   int id = 0;
 //   String nome = "";
 //   int historia = 0;
 //   int vida = 0;
 //   int ataque = 0;
 //   int defesa = 0;
 //   int arma = 0;
 //   int armadura = 0;
 //   int item1 = 0;
 //   int item2 = 0;
 //   int item3 = 0;
 // }



  Jogador.fromMap(Map <String, dynamic> map) {
    id =      map[colunaId];
    nome =    map[colunaNome];
    historia = map[colunaHistoria];
    vida =    map[colunaVida];
    ataque =  map[colunaAtaque];
    defesa =  map[colunaDefesa];
    dinheiro =  map[colunaDinheiro];
    arma =    map[colunaArma];
    armadura =map[colunaArmadura];
    item1 =   map[colunaItem1];
    item2 =   map[colunaItem2];
    item3 =   map[colunaItem3];
  }

  Map<String, dynamic> toMap() {
     var map = <String, dynamic>{
       colunaId: id,
      colunaNome: nome,
      colunaHistoria: historia,
      colunaVida: vida,
      colunaAtaque:ataque,
      colunaDefesa:defesa,
      colunaDinheiro:dinheiro,
      colunaArma:arma,
      colunaArmadura:armadura,
      colunaItem1:item1,
      colunaItem2:item2,
      colunaItem3:item3
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
        "dinheiro: $dinheiro | "
        "arma: $arma | "
        "armadura: $armadura | "
        "item1: $item1 | "
        "item2: $item2 | "
        "item3: $item3 | ");
  }

}