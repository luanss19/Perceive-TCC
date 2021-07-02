import 'package:shared_preferences/shared_preferences.dart';

class Salvamento {

  void novoJogo() async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt('historia', 0);
  }

  Future<int> carregarJogo(String key) async {
    var pref = await SharedPreferences.getInstance();
    var number = pref.getInt(key) ?? 0;
    print(number);
    return number;
  }

  Future<void> salvarJogo(String key, int value) async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }
}