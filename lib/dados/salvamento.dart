import 'package:perceive/dados/jogador.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tabelaJogador = "jogador";

final String colunaId = "id";
final String colunaHistoria = "historia";
final String colunaNome = "nome";
final String colunaVida = "vida";
final String colunaAtaque = "ataque";
final String colunaDefesa = "defesa";
final String colunaArma = "arma";
final String colunaArmadura = "armadura";
final String colunaItem1 = "item1";
final String colunaItem2 = "item2";
final String colunaItem3 = "item3";


class Salvamento {

  static final Salvamento _instance = Salvamento.interno();

  factory Salvamento() => _instance;

  Salvamento.interno();

  late Database _banco;

  Future<Database> get banco async {
    if(_banco != null) {
      return _banco;
    }
    else {
      _banco = await iniciarBanco();
      return _banco;
    }
  }

  Future<Database> iniciarBanco() async {
    final caminhoDoBanco = await getDatabasesPath();

    final caminho = join(caminhoDoBanco, "jogadores.db");

    return openDatabase(caminho, version: 1,
        onCreate: (Database banco, int novaVersao) async {
          await banco.execute(
              "CREATE TABLE $tabelaJogador("
                  "$colunaId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
                  "$colunaNome TEXT , "
                  "$colunaHistoria INTEGER, "
                  "$colunaVida INTEGER, "
                  "$colunaAtaque INTEGER, "
                  "$colunaDefesa INTEGER, "
                  "$colunaArma INTEGER, "
                  "$colunaArmadura INTEGER, "
                  "$colunaItem1 INTEGER, "
                  "$colunaItem2 INTEGER, "
                  "$colunaItem3 INTEGER, )"
          );
        });
  }

  Future<Jogador> salvar(Jogador jogador) async {
    Database bancoJogador = await banco;
    jogador.id = await bancoJogador.insert(tabelaJogador, jogador.toMap());
    return jogador;
  }

  Future<Jogador?> carregar(int id) async {
    Database bancoJogador = await banco;
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
    Database bancoJogador = await banco;
    return await bancoJogador.delete(tabelaJogador,
        where: "$colunaId = ?",
        whereArgs: [id]
    );
  }

  Future<List> consultarJogadores() async {
    Database bancoJogador = await banco;
    List<Map> retorno = await bancoJogador.rawQuery(
        "SELECT * FROM $tabelaJogador");
    List<Jogador> jogadores = [];
    for(Map jogador in retorno) {
      jogadores.add(Jogador.fromMap(jogador));
    }
    return jogadores;
  }



  Future<int> atualizarJogador(Jogador jogador) async {
    Database bancoJogador = await banco;
    return await bancoJogador.update(tabelaJogador, jogador.toMap(),
        where: "$colunaId = ?",
        whereArgs: [jogador.id]
    );
  }


  Future fecharBanco() async {
    Database bancoJogador = await banco;
    bancoJogador.close();
  }

}