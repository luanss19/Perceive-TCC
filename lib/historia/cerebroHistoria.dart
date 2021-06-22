import 'historia.dart';

class cerebroHistoria {
  List<Historia> _dadosHistoria = [
    Historia(tituloHistoria: 'Descrição da ambientação', escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Descrença em magia', escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Onde se passa', escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Apresentar uma Fação maior', escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Breve descrição do local do herói', escolha1: 'Próximo'),

    Historia(
        tituloHistoria: 'Descrição da abientação até alguém bater em sua porta',
        escolha1: 'Abrir a porta',
        escolha2: 'Demorar a abrir a porta',
        escolha3: 'Mandar embora'
    ),

    Historia(tituloHistoria: 'Resposta agradável', escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Resposta irritada', escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Resposta rude/ameaçadora', escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Apresentação de objetivo', escolha1: 'Próximo'),

    Historia(
        tituloHistoria: 'Descrição do personagem indo embora/Tentativa em outro dia'),


  ];

  bool eNarracao = true;

  bool botaoVisivel() => eNarracao == true ? false : true;

  Historia get historia => _dadosHistoria[_numeroHistoria];

  int _numeroHistoria = 0;

  void proxHistoria(int numeroEscolha) {
    switch (_numeroHistoria) {
      case 0:
        _numeroHistoria = 1;
        eNarracao = true;
        break;
      case 1:
        _numeroHistoria = 2;
        eNarracao = true;
        break;
      case 2:
        _numeroHistoria = 3;
        eNarracao = true;
        break;
      case 3:
        _numeroHistoria = 4;
        eNarracao = true;
        break;
      case 4:
        _numeroHistoria = 5;
        eNarracao = true;
        break;
      case 5:
        _numeroHistoria = 6;
        eNarracao = false;
        break;
      case 6:
        eNarracao = false;
        if (numeroEscolha == 1) { //abrir porta bom
          _numeroHistoria = 7;
        }
        else if (numeroEscolha == 2) { //abrir porta demorando
          _numeroHistoria = 8;
        }
        else if (numeroEscolha == 3) { //mandar embora
          _numeroHistoria = 9;
        }
        break;
      case 7: //resposta boa
        _numeroHistoria = 10;
        eNarracao = true;
        break;
      case 8: //resposta irritada
        _numeroHistoria = 10;
        eNarracao = true;
        break;
      case 9: //resposta rude/volta outro dia
        _numeroHistoria = 11;
        eNarracao = true;
        break;
      case 10: //Apresentação de objetivo
        _numeroHistoria = 12;
        eNarracao = true;
        break;
      case 11: //Descriçao do personagem indo embora/tentativa em outro dia
        if (numeroEscolha == 1) { //pedir desculpas
          _numeroHistoria = 10;
        }
        else if (numeroEscolha == 2) { //mandar embora (fim)
          _numeroHistoria = 13;
        }
        break;
      case 12: //Apresentação das caracteristicas personagem
        _numeroHistoria = 15;
        eNarracao = true;
        break;
      case 13: //Fim precoce do jogo
        _numeroHistoria = 14;
        eNarracao = true;
        break;
      case 14: //tela de game-over
        _numeroHistoria = 0;
        eNarracao = true;
        break;
    //TODO: adicionar o resto do desenvolvimento da história

      default:
        _numeroHistoria = 0;
        break;
    }
    //funcao para deixar botoes invisiveis se for tela de narracao

  }
}