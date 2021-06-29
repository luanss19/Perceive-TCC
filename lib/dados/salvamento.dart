import 'package:perceive/telas/telaInGame.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Salvamento {
  late SharedPreferences pref ;

  void novoJogo() async {
    pref = await SharedPreferences.getInstance();
    pref.setInt('historia', 0);
  }

  Future<int> carregarJogo(String key) async {
    pref = await SharedPreferences.getInstance();
    var number = pref.getInt(key) ?? 0;
    return number;
  }

  Future<void> salvarJogo(String key, int value) async {
    pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }
}