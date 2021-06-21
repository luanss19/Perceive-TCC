import 'historia.dart';

class cerebroHistoria {
  List<Historia> _dadosHistoria = [
    Historia(
        tituloHistoria: 'A',
        escolha1: 'c',
        escolha2: 'b',
        escolha3: '3'
    ),

    Historia(
        tituloHistoria: 'B',
        escolha1: 'c',
        escolha2: '2',
        escolha3: '3'),
    Historia(
        tituloHistoria:
        'C',
        escolha1: 'f',
        escolha2: '2',
        escolha3: '3'),
    Historia(
        tituloHistoria:
        'D',
        escolha1: 'Restart',
        escolha2: '2',
        escolha3: '3'),
    Historia(
        tituloHistoria:
        'E',
        escolha1: 'Restart',
        escolha2: '2',
        escolha3: '3'),
    Historia(
        tituloHistoria:
        'F',
        escolha1: 'Restart',
        escolha2: '',
        escolha3: ''
    )
  ];

  Historia get historia => _dadosHistoria [_numeroHisoria];

  int _numeroHisoria = 0;
  void proxHistoria(int numeroEscolha){
    switch(_numeroHisoria){
      case 0:
        numeroEscolha == 1 ? _numeroHisoria = 2 : _numeroHisoria = 1;
        break;
      case 1:
        numeroEscolha == 1 ? _numeroHisoria = 2 : _numeroHisoria = 3;
        break;
      case 2:
        numeroEscolha == 1 ? _numeroHisoria= 5 : _numeroHisoria = 4;
        break;
      case 3:
        numeroEscolha == 1 ? _numeroHisoria= 6 : _numeroHisoria = 5;
        break;
      default:
        _numeroHisoria = 0;
        break;
    }
  }
}