import 'historia.dart';

class cerebroHistoria {

  List<Historia> _dadosHistoria = [
    Historia(tituloHistoria: 'Descrição da ambientação', escolha1: 'Próximo'),//0

    Historia(tituloHistoria: 'Descrença em magia', escolha1: 'Próximo'),//1

    Historia(tituloHistoria: 'Onde se passa', escolha1: 'Próximo'),//2

    Historia(tituloHistoria: 'Apresentar uma Fação maior', escolha1: 'Próximo'),//3

    Historia(tituloHistoria: 'Breve descrição do local do herói', escolha1: 'Próximo'),//4

    Historia(tituloHistoria: 'Descrição da abientação até alguém bater em sua porta',//5
        escolha1: 'Abrir a porta',
        escolha2: 'Demorar a abrir a porta',
        escolha3: 'Mandar embora'
    ),

    Historia(tituloHistoria: 'Resposta agradável', escolha1: 'Próximo'),//6

    Historia(tituloHistoria: 'Resposta irritada', escolha1: 'Próximo'),//7

    Historia(tituloHistoria: 'Resposta rude/ameaçadora', escolha1: 'Próximo'),//8

    Historia(tituloHistoria: 'Apresentação de objetivo', escolha1: 'Próximo'),//9

    Historia(tituloHistoria: 'Descrição do personagem indo embora/Tentativa em outro dia',//10
      escolha1:'Pedir desculpas pelo outro dia',
      escolha2: 'Mandar embora de novo (fim precoce)'
    ),

    Historia(tituloHistoria: 'Apresentação das caracteristicas personagem', escolha1: 'Próximo'),//1

    Historia(tituloHistoria: 'Fim precoce do jogo/descrição consequencias de não aceitar', escolha1: 'Próximo'),//12

    Historia(tituloHistoria: 'Tela de game-over', escolha1: 'Próximo'),//13

    Historia(tituloHistoria: 'Dialogo outro personagem', escolha1: 'Perguntar o que veio fazer aqui',escolha2: 'Pedir para entrar e sairda chuva'),//14

    Historia(tituloHistoria: 'Resposta explicando missao', escolha1: 'Próximo'),//15

    Historia(tituloHistoria: 'Resposta explicando missao exaltando passado e escolha de resposta do player', escolha1: 'Resposta aceitando missao', escolha2: 'Resposta agradecendo elogio'), //16

    Historia(tituloHistoria: 'Resposta aceitando missao e perguntando sobre recompensa', escolha1: 'Próximo'),//17

    Historia(tituloHistoria: 'Resposta falando da recompensa de maneira desleixada', escolha1: 'Próximo'),//18

    Historia(tituloHistoria: 'Heroi repensando escolha', escolha1: 'Próximo'),//19

    Historia(tituloHistoria: 'Resposta reafirmando elogio e falando da recompensa', escolha1: 'Próximo'),//20

    Historia(tituloHistoria: 'Heroi se preparando e pegando itens', escolha1: 'Próximo'),//21

    Historia(tituloHistoria: 'Descrição de como estão os itens na casa e como são', escolha1: 'Próximo'),//22

    Historia(tituloHistoria: 'Mensagem do jogo explicando sistema de inventario', escolha1: 'Próximo'),//23

    Historia(tituloHistoria: 'Saida para a jornada/fim Demo', escolha1: 'Fim demo'),//24



  ];

  bool eNarracao = true;

  bool botaoVisivel() => eNarracao == false ? true : false;

  int _numeroHistoria = 0;

  Historia get historia => _dadosHistoria[_numeroHistoria];

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
          eNarracao = false;
          break;
        case 5:
          if (numeroEscolha == 1) { //abrir porta bom
            print(numeroEscolha);
            _numeroHistoria = 6;
            eNarracao = true;
            break;
          }
          else if (numeroEscolha == 2) { //abrir porta demorando
            print(numeroEscolha);
            _numeroHistoria = 7;
            eNarracao = true;
            break;
          }
          else if (numeroEscolha == 3) { //mandar embora
            print(numeroEscolha);
            _numeroHistoria = 8;
            eNarracao = true;
            break;
          }
          break;
        case 6: //resposta boa
          _numeroHistoria = 9;
          eNarracao = true;
          break;
        case 7: //resposta irritada
          _numeroHistoria = 9;
          eNarracao = true;
          break;
        case 8: //resposta rude/volta outro dia
          _numeroHistoria = 10;
          eNarracao = false;
          break;
        case 9: //Apresentação de objetivo
          _numeroHistoria = 11;
          eNarracao = true;
          print(_numeroHistoria);
          break;
        case 10: //Descriçao do personagem indo embora/tentativa em outro dia
          if (numeroEscolha == 1) { //pedir desculpas
            _numeroHistoria = 9;
          }
          else if (numeroEscolha == 2) { //mandar embora (fim)
            _numeroHistoria = 12;
          }
          break;
        case 11: //Apresentação das caracteristicas personagem
          _numeroHistoria = 14;
          eNarracao = false;
          break;
        case 12: //Fim precoce do jogo/descrição consequencias de não aceitar
          _numeroHistoria = 13;
          eNarracao = true;
          break;
        case 13: //tela de game-over
          _numeroHistoria = 0;
          eNarracao = true;
          break;
        case 14: // dialogo outro personagem
          if (numeroEscolha == 1) { //Perguntar o que veio fazer aqui
            _numeroHistoria = 15;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //Pedir para entrar e sairda chuva
            _numeroHistoria = 16;
            eNarracao = false;
          }
          break;
        case 15: //resposta explicando missao
          _numeroHistoria = 17;
          eNarracao = true;
          break;
        case 16://resposta explicando missao exaltando passado e escolha de resposta do player
          if (numeroEscolha == 1) { //resposta aceitando missao
            _numeroHistoria = 19;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //resposta agradecendo elogio
            _numeroHistoria = 20;
            eNarracao = true;
          }
          break;
        case 17:// resposta aceitando missao e perguntando sobre recompensa
          _numeroHistoria = 18;
          eNarracao = true;
          break;
        case 18: //resposta falando da recompensa de maneira desleixada
          _numeroHistoria = 19;
          eNarracao = true;
          break;
        case 19: //heroi repensando escolha
          _numeroHistoria = 21;
          eNarracao = true;
          break;
        case 20: //resposta reafirmando elogio e falando da recompensa
          _numeroHistoria = 19;
          eNarracao = true;
          break;
      case 21: //Heroi se preparando e pegando itens
        _numeroHistoria = 22;
        eNarracao = true;
        break;
      case 22: //Descrição de como estão os itens na casa e como são
        _numeroHistoria = 23;
        eNarracao = true;
        break;
      case 23: //Mensagem do jogo explicando sistema de inventario
        _numeroHistoria = 24;
        eNarracao = true;
        break;
      case 24: //Saida para a jornada/fim Demo
        _numeroHistoria = 0;
        eNarracao = true;
        break;

      default:
        _numeroHistoria = 0;
        break;
    }
    //funcao para deixar botoes invisiveis se for tela de narracao

  }
}