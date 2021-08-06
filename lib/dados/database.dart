import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabasePerceive {

 static final _databaseName = "perceive.db";
 static final String tabelaJogador = "jogadores";

 static final String colunaId = "id";
 static final String colunaHistoria = "historia";
 static final String colunaNome = "nome";
 static final String colunaVida = "vida";
 static final String colunaAtaque = "ataque";
 static final String colunaDefesa = "defesa";
 static final String colunaArma = "arma";
 static final String colunaArmadura = "armadura";
 static final String colunaItem1 = "item1";
 static final String colunaItem2 = "item2";
 static final String colunaItem3 = "item3";

 DatabasePerceive._privateConstructor();
 static final DatabasePerceive instance = DatabasePerceive._privateConstructor();

 static Database? _banco;


 Future<Database> get database async =>
     _banco ??= await _iniciarBanco();

 Future<Database> _iniciarBanco() async {
   Directory documentsDirectory = await getApplicationDocumentsDirectory();
   String path = join(documentsDirectory.path, _databaseName);
   return await openDatabase(path,
       version: 1,
       onCreate: _onCreate);
 }

 Future _onCreate(Database db, int version) async {
   await db.execute("CREATE TABLE $tabelaJogador (id INTEGER PRIMARY KEY, nome TEXT, historia INTEGER, vida INTEGER, ataque INTEGER, defesa INTEGER, arma INTEGER, armadura INTEGER, item1 INTEGER, item2 INTEGER, item3 INTEGER)");
 }

  Future<Jogador> salvar(Jogador jogador) async {
    Database bancoJogador = await instance.database;
    jogador.id = await bancoJogador.insert(tabelaJogador, jogador.toMap());
    return jogador;
  }

 Future<int> insert(Map<String, dynamic> row) async {
   Database db = await instance.database;
   return await db.insert(tabelaJogador, row);
 }
 Future<List<Map<String, dynamic>>> queryAllRows() async {
   Database db = await instance.database;
   return await db.query(tabelaJogador);
 }
  Future<Jogador?> carregar(int id) async {
    Database bancoJogador = await instance.database;
    List<Map> retorno = await bancoJogador.query(
        tabelaJogador,
        columns: [colunaId,
          colunaNome,
          colunaVida,
          colunaHistoria,
          colunaAtaque,
          colunaDefesa,
          colunaArma,
          colunaArmadura,
          colunaItem1,
          colunaItem2,
          colunaItem3],
        where: "$colunaId = ?",
        whereArgs: [id]);
    if(retorno.length > 0) {
      return Jogador.fromMap(retorno.first);
    }
    else {
      return null;
    }
  }

  Future<int> deletarJogador(int id) async {
    Database bancoJogador = await instance.database;
    return await bancoJogador.delete(tabelaJogador,
        where: "$colunaId = ?",
        whereArgs: [id]
    );
  }

  Future<List> consultarJogadores() async {
    Database bancoJogador = await instance.database;
    List<Map> retorno = await bancoJogador.rawQuery(
        "SELECT * FROM $tabelaJogador");
    List<Jogador> jogadores = [];
    for(Map jogador in retorno) {
      jogadores.add(Jogador.fromMap(jogador));
    }
    return jogadores;
  }



  Future<int> atualizarJogador(Jogador jogador) async {
    Database bancoJogador = await instance.database;
    return await bancoJogador.update(tabelaJogador, jogador.toMap(),
        where: "$colunaId = ?",
        whereArgs: [jogador.id]
    );
  }


  Future fecharBanco() async {
    Database bancoJogador = await instance.database;
    bancoJogador.close();
  }

}