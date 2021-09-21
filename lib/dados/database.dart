import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:perceive/dados/jogador.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:perceive/dados/jogador.dart';

class DatabasePerceive {

 static const _databaseName = "perceive_db.db";
 static const _databaseVersion = 1;



 DatabasePerceive._privateConstructor();
 static final DatabasePerceive instance = DatabasePerceive._privateConstructor();

 static Database? _banco;


 Future<Database> get database async =>
     _banco ??= await _iniciarBanco();


 Future<Database> _iniciarBanco() async {
   Directory documentsDirectory = await getApplicationDocumentsDirectory();
   String path = join(documentsDirectory.path, _databaseName);
   return await openDatabase(path,
       version: _databaseVersion,
       onCreate: _onCreate);
 }

 Future _onCreate(Database db, int version) async {
   await db.execute('''
   CREATE TABLE ${Jogador.tabelaJogador} (
       ${Jogador.colunaId} INTEGER PRIMARY KEY AUTOINCREMENT, 
       ${Jogador.colunaHistoria} INTEGER, 
       ${Jogador.colunaNome } TEXT, 
       ${Jogador.colunaVida} INTEGER, 
       ${Jogador.colunaAtaque } INTEGER, 
       ${Jogador.colunaDefesa } INTEGER,
       ${Jogador.colunaDinheiro } INTEGER,
       ${Jogador.colunaArma } INTEGER, 
       ${Jogador.colunaArmadura} INTEGER, 
       ${Jogador.colunaItem1} INTEGER, 
       ${Jogador.colunaItem2} INTEGER, 
       ${Jogador.colunaItem3} INTEGER)''');
 }

  Future<int> salvarJogador(Jogador jogador) async {
    Database db = await database;
    return await db.insert(Jogador.tabelaJogador, jogador.toMap());
  }

 Future<List<Jogador>> listarJogadores() async {
  Database db = await instance.database;
  var jogadores = await db.query(Jogador.tabelaJogador);
  return jogadores.length == 0
  ?[]
  :jogadores.map((x) => Jogador.fromMap(x)).toList();
 }

 Future<void> droptable() async {

   Database db = await instance.database;

   await db.execute("DROP TABLE IF EXISTS ${Jogador.tabelaJogador}");

   await db.execute('''
   CREATE TABLE ${Jogador.tabelaJogador} (
       ${Jogador.colunaId} INTEGER PRIMARY KEY AUTOINCREMENT, 
       ${Jogador.colunaHistoria} INTEGER, 
       ${Jogador.colunaNome } TEXT, 
       ${Jogador.colunaVida} INTEGER, 
       ${Jogador.colunaAtaque } INTEGER, 
       ${Jogador.colunaDefesa } INTEGER, 
       ${Jogador.colunaDinheiro } INTEGER, 
       ${Jogador.colunaArma } INTEGER, 
       ${Jogador.colunaArmadura} INTEGER, 
       ${Jogador.colunaItem1} INTEGER, 
       ${Jogador.colunaItem2} INTEGER, 
       ${Jogador.colunaItem3} INTEGER)''');

 }



 Future<Jogador> carregar(int id) async {
   Database bancoJogador = await instance.database;
   final retorno = await bancoJogador.query(
       Jogador.tabelaJogador,
       columns: [Jogador.colunaId,
         Jogador.colunaNome,
         Jogador.colunaVida,
         Jogador.colunaHistoria,
         Jogador.colunaAtaque,
         Jogador.colunaDefesa,
         Jogador.colunaDinheiro,
         Jogador.colunaArma,
         Jogador.colunaArmadura,
         Jogador.colunaItem1,
         Jogador.colunaItem2,
         Jogador.colunaItem3],
       where: "${Jogador.colunaId} = ?",
       whereArgs: [id]);
   if(retorno.length > 0) {
     print(Jogador.fromMap(retorno.first));
     return Jogador.fromMap(retorno.first);
   }
   else {
     throw Exception("erro");
   }
 }

  Future<int> deletarJogoSalvo(int id) async {
    Database bancoJogador = await instance.database;
    return await bancoJogador.delete(Jogador.tabelaJogador,
        where: "${Jogador.colunaId} = ?",
        whereArgs: [id]
    );
  }

  Future updateHistoria(int id,int numhistoria) async {
    Database bancoJogador = await instance.database;
    await bancoJogador.rawUpdate('''
    UPDATE ${Jogador.tabelaJogador} 
    SET historia = ?
    WHERE id = ? ''',
        [numhistoria,id]);
    }


  Future<Jogador> ultimoRegistro() async {
    Database bancoJogador = await instance.database;
    final retorno = await bancoJogador.rawQuery('''
    SELECT * FROM ${Jogador.tabelaJogador} 
    ORDER BY id DESC
    LIMIT 1''');
    if(retorno.length > 0) {
      print(Jogador.fromMap(retorno.first));
      return Jogador.fromMap(retorno.first);
    }
    else {
      throw Exception("erro");
    }
  }

  Future<int> atualizarJogador(Jogador jogador) async {
    Database bancoJogador = await instance.database;
    return await bancoJogador.update(Jogador.tabelaJogador, jogador.toMap(),
        where: "${Jogador.colunaId} = ?",
        whereArgs: [jogador.id]
    );
  }


  Future fecharBanco() async {
    Database bancoJogador = await instance.database;
    bancoJogador.close();
  }

}