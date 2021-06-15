class Historia {
  String _tituloHistoria;
  String _escolha1;
  String _escolha2;

  Historia({String tituloHistoria, String escolha1, String escolha2}){
    this._tituloHistoria = tituloHistoria;
    this._escolha1 = escolha1;
    this._escolha2 = escolha2;
  }

  String get escolha2 => _escolha2;

  String get escolha1 => _escolha1;

  String get tituloHistoria => _tituloHistoria;
}