import 'package:perceive/telas/telaInicial.dart';
import 'package:perceive/dados/salvamento.dart';
import 'historia.dart';
import 'package:get/get.dart';

class cerebroHistoria {

  List<Historia> _dadosHistoria = [
    Historia(tituloHistoria: 'Algumas centenas de anos atrás, o Continente de NOMECONTINENTE estava em sua era de ouro pelos bens que a magia trouxera à população local. Magos, guerreiros, e criaturas mágicas vagavam pelas terras de NOMEPAÍS.',
        escolha1: 'Próximo'),//0

    Historia(tituloHistoria: 'Após anos de uso irresponsável dos poderes mágicos dados pelos deuses, os humanos perceberam que sua ganância tinha os levado à um caminho sem volta.Por algum motivo as linhas mágicas que ligavam cada ser ao mundo foram seladas, e a magia virou um mito. E os mitos caíram em esquecimento.',
        escolha1: 'Próximo'),//1

    Historia(tituloHistoria: 'Na cidade de NOMECIDADE os ventos sibilantes pediam por mudanças, as terras estavam inférteis e o povo descontente por como estavam sendo tratados pelo soberano local. As terras que antes abrigavam vida hoje abrigam desesperança',
        escolha1: 'Próximo'),//2

    Historia(tituloHistoria: 'Os reis de cada nação controlam seu súditos com mãos de ferro, e estes são auxiliados pelas ordens religiosas ORDEM1, ORDEM2 e ORDEM3, que representam os três deuses do panteão do continente DEUS1, DEUS2 E DEUS3. A região de cidade é auxiliada pela ordem ORDEM1.',
        escolha1: 'Próximo'),//3

    Historia(tituloHistoria: 'No subúrbio da cidade NOMECIDADE onde bêbados, mendigos e todo tipo de maltrapilhos passavam havia uma casa onde até mesmo os mais corajosos tinham um pouco de receio de chegar, suas janelas estavam sempre cobertas por espessas cortinas negras, o que deixava esse local nem um pouco convidativo.',
        escolha1: 'Próximo'),//4

    Historia(tituloHistoria: 'Pelas ruas lamacentas dos subúrbios, passos pesados podiam ser ouvidos em direção à peculiar casa. Com uma respiração ofegante Lázaro, o mensageiro real, chegava e se preparava para bater à porta que possuía pequenos buracos feitos por cupins. ',//5
        escolha1: 'Abrir a porta',
        escolha2: 'Demorar a abrir a porta',
        escolha3: 'Mandar embora'),//5

    Historia(tituloHistoria: 'Resposta agradável', escolha1: 'Próximo'),//6

    Historia(tituloHistoria: 'Resposta irritada', escolha1: 'Próximo'),//7

    Historia(tituloHistoria: 'Resposta rude/ameaçadora', escolha1: 'Próximo'),//8

    Historia(tituloHistoria: 'Apresentação de objetivo', escolha1: 'Próximo'),//9

    Historia(tituloHistoria: 'Após essa tentativa falha de fazer seu comunicado, Lázaro bufa proferindo xingamentos  contidos e fala em voz alta “Voltarei amanhã, e espero mais respeito”. Assim como prometido, na manhã seguinte Lázaro se encontra batendo na mesma velha porta sob uma forte chuva.',//10
      escolha1:'Pedir desculpas pelo outro dia',
      escolha2: 'Mandar embora de novo'),//10

    Historia(tituloHistoria: 'Apresentação das caracteristicas personagem', escolha1: 'Próximo'),//11

    Historia(tituloHistoria: 'Após lutar contra seu destino, o nosso herói seguiu o marasmo de sua vida. Caindo em dívidas devido às sabotagens que sua carreira sofreu por aquele que seria seu contratante.', escolha1: 'Próximo'),//12

    Historia(tituloHistoria: 'Fim.', escolha1: 'Reiniciar Jogo.'),//13

    Historia(tituloHistoria: 'Dialogo outro personagem',
        escolha1: 'Perguntar o que veio fazer aqui',
        escolha2: 'Pedir para entrar e sair da chuva'),//14

    Historia(tituloHistoria: 'Resposta explicando missao', escolha1: 'Próximo'),//15

    Historia(tituloHistoria: 'Resposta explicando missao exaltando passado e escolha de resposta do player',
        escolha1: 'Resposta aceitando missao',
        escolha2: 'Resposta agradecendo elogio'), //16

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

//funcões para deixar botoes invisiveis se for tela de narracao
  bool botaoVisivel() => eNarracao == false ? true : false;
  bool botaoVisivel2() {
    if(eNarracao == false && numeroHistoria == 10){
      return false;
    }
    else if(eNarracao == false && numeroHistoria == 14){
      return false;
    }
    else if(eNarracao == false && numeroHistoria == 16){
      return false;
    }
    else if (eNarracao == false){
      return true;
    }
    else if (eNarracao == true){
      return false;
    }
    return false;
  }


  int numeroHistoria = 0;
  Salvamento _salvamento = new Salvamento();

  Historia get historia => _dadosHistoria[numeroHistoria];

  void proxHistoria(int numeroEscolha) {
    switch (numeroHistoria) {
        case 0:
          numeroHistoria = 1;
          eNarracao = true;
          break;
        case 1:
          numeroHistoria = 2;
          eNarracao = true;
          break;
        case 2:
          numeroHistoria = 3;
          eNarracao = true;
          break;
        case 3:
          numeroHistoria = 4;
          eNarracao = true;
          break;
        case 4:
          numeroHistoria = 5;
          eNarracao = false;
          break;
        case 5:
          if (numeroEscolha == 1) { //abrir porta bom
            numeroHistoria = 6;
            eNarracao = true;
            break;
          }
          else if (numeroEscolha == 2) { //abrir porta demorando
            numeroHistoria = 7;
            eNarracao = true;
            break;
          }
          else if (numeroEscolha == 3) { //mandar embora
            numeroHistoria = 8;
            eNarracao = true;

            break;
          }
          break;
        case 6: //resposta boa
          numeroHistoria = 9;
          eNarracao = true;
          break;
        case 7: //resposta irritada
          numeroHistoria = 9;
          eNarracao = true;
          break;
        case 8: //resposta rude/volta outro dia
          numeroHistoria = 10;
          eNarracao = false;
          break;
        case 9: //Apresentação de objetivo
          numeroHistoria = 11;
          eNarracao = true;
          break;
        case 10: //Descriçao do personagem indo embora/tentativa em outro dia
          if (numeroEscolha == 1) { //pedir desculpas
            numeroHistoria = 9;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //mandar embora (fim)
            numeroHistoria = 12;
            eNarracao = true;
          }
          break;
        case 11: //Apresentação das caracteristicas personagem
          numeroHistoria = 14;
          eNarracao = false;
          break;
        case 12: //Fim precoce do jogo/descrição consequencias de não aceitar
          numeroHistoria = 13;
          eNarracao = true;
          break;
        case 13: //tela de game-over
          numeroHistoria = 0;
          eNarracao = true;
          break;
        case 14: // dialogo outro personagem
          if (numeroEscolha == 1) { //Perguntar o que veio fazer aqui
            numeroHistoria = 15;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //Pedir para entrar e sairda chuva
            numeroHistoria = 16;
            eNarracao = false;
          }
          break;
        case 15: //resposta explicando missao
          numeroHistoria = 17;
          eNarracao = true;
          break;
        case 16://resposta explicando missao exaltando passado e escolha de resposta do player
          if (numeroEscolha == 1) { //resposta aceitando missao
            numeroHistoria = 19;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //resposta agradecendo elogio
            numeroHistoria = 20;
            eNarracao = true;
          }
          break;
        case 17:// resposta aceitando missao e perguntando sobre recompensa
          numeroHistoria = 18;
          eNarracao = true;
          break;
        case 18: //resposta falando da recompensa de maneira desleixada
          numeroHistoria = 19;
          eNarracao = true;
          break;
        case 19: //heroi repensando escolha
          numeroHistoria = 21;
          eNarracao = true;
          break;
        case 20: //resposta reafirmando elogio e falando da recompensa
          numeroHistoria = 19;
          eNarracao = true;
          break;
      case 21: //Heroi se preparando e pegando itens
        numeroHistoria = 22;
        eNarracao = true;
        break;
      case 22: //Descrição de como estão os itens na casa e como são
        numeroHistoria = 23;
        eNarracao = true;
        break;
      case 23: //Mensagem do jogo explicando sistema de inventario
        numeroHistoria = 24;
        eNarracao = true;
        break;
      case 24: //Saida para a jornada/fim Demo
        numeroHistoria = 0;
        eNarracao = true;
        Get.back();
        Get.to(() => TelaInicial());
        break;

      default:
        numeroHistoria = 0;
        break;
    }


  }
}