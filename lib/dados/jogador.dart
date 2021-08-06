import 'package:perceive/dados/database.dart';
class Jogador {
 // int id = 0;
 // String nome= "";
 // int historia= 0;
 // int vida= 0;
 // int ataque= 0;
 // int defesa= 0;
 // int arma= 0;
 // int armadura= 0;
 // int item1= 0;
 // int item2= 0;
 // int item3= 0;
 //
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

 Jogador() {
   int id = 0;
   String nome = "";
   int historia = 0;
   int vida = 0;
   int ataque = 0;
   int defesa = 0;
   int arma = 0;
   int armadura = 0;
   int item1 = 0;
   int item2 = 0;
   int item3 = 0;
 }
 // Jogador({
 //   required this.id,
 //   required this.nome,
 //   required this.historia,
 //   required this.ataque,
 //   required this.defesa,
 //   required this.arma,
 //   required this.armadura,
 //   required this.item1,
 //   required this.item2,
 //   required this.item3,
 // });


  Jogador.fromMap(Map map) {
    id =      map[id];
    nome =    map[nome];
    historia = map[historia];
    vida =    map[vida];
    ataque =  map[ataque];
    defesa =  map[defesa];
    arma =    map[arma];
    armadura =map[armadura];
    item1 =   map[item1];
    item2 =   map[item2];
    item3 =   map[item3];
  }

  toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "nome": nome,
      "historia": historia,
      "vida": vida,
      "ataque":ataque,
      "defesa":defesa,
      "arma":arma,
      "armadura":armadura,
      "item1":item1,
      "item2":item2,
      "item3":item3
    };
    if (id != null) {
      map["id"] = id;
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