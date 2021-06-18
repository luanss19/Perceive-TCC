class Historia {
  String _tituloHistoria;
  String _escolha1;
  String _escolha2;
  String _escolha3;

  Historia({String tituloHistoria, String escolha1, String escolha2, String escolha3}){
    this._tituloHistoria = tituloHistoria;
    this._escolha1 = escolha1;
    this._escolha2 = escolha2;
    this._escolha3 = escolha3;
  }

  String get escolha3 => _escolha3;

  String get escolha2 => _escolha2;

  String get escolha1 => _escolha1;

  String get tituloHistoria => _tituloHistoria;
}