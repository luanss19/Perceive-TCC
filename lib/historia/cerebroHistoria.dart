import 'package:perceive/dados/jogador.dart';
import 'package:perceive/telas/telaInicial.dart';
import 'package:perceive/dados/database.dart';
import 'historia.dart';
import 'package:get/get.dart';
import 'package:perceive/dados/global.dart' as globais;

class cerebroHistoria {
  List<Historia> dadosHistoria = [
    Historia(tituloHistoria: ' Algumas centenas de anos atrás, o Reino de Lothar estava em sua era de ouro pelos bens que a magia trouxera à população local.'
        ' Magos, guerreiros, e aventureiros de todos os tipos buscavam a sorte na cidade de Melenor, a capital do Reino.',
        escolha1: 'Próximo'),//0

    Historia(tituloHistoria: 'Após anos de uso irresponsável dos poderes mágicos dados pelos deuses, os humanos perceberam que sua ganância tinha os levado '
        'à um caminho sem volta.Por algum motivo as linhas mágicas que ligavam cada ser ao mundo foram seladas, e a magia virou um mito. E os mitos caíram em'
        ' esquecimento.',
        escolha1: 'Próximo'),//1

    Historia(tituloHistoria: 'Em Melenor os ventos sibilantes pediam por mudanças. As terras estavam inférteis e o povo descontente pelo modo negligente que '
        'estavam sendo governados pelo Rei. O local que antes abrigava vida, hoje abriga desesperança.',
        escolha1: 'Próximo'),//2

    Historia(tituloHistoria: 'Após ficar devastado pela morte da rainha o rei de Lothar passou a não cumprir com seu papel e foi brutalmente assassinado'
        ' em circunstâncias misteriosas. Aproveitando a instabilidade do reino os sacerdotes de Zahar, o Deus da lei e da autoridade, lentamente começaram '
        'a disseminar suas ideias na corte e tomaram o poder alegando a necessidade de ordem em um momento tão caótico.',
        escolha1: 'Próximo'),//3

    Historia(tituloHistoria: 'PLAYER , você faz parte de um grupo investigativo contratado por nobres que eram antigos aliados do rei, seu objetivo é'
        ' descobrir o que causou a morte de ambos Rei e Rainha.',
        escolha1: 'Próximo'),//4

    Historia(tituloHistoria: 'No subúrbio da capital onde bêbados, mendigos e todo tipo de maltrapilhos passavam havia uma casa onde até mesmo os mais '
        'corajosos tinham um pouco de receio de chegar, suas janelas estavam sempre cobertas por espessas cortinas negras, o que deixava esse local nem '
        'um pouco convidativo.',
        escolha1: 'Próximo'),//5

    Historia(tituloHistoria: 'Por ruas lamacentas, passos pesados podiam ser ouvidos em direção à peculiar casa. Com uma respiração ofegante você chega '
        'e se prepara para bater à porta que possui pequenos buracos feitos por cupins.',
        escolha1: 'Bater à porta e esperar alguma resposta',
        escolha2: 'Chutar a porta',),//6

    Historia(tituloHistoria: 'Após bater algumas vezes a chuva começa a ficar cada vez mais forte e você se vê sem muitas opções.', escolha1: 'Próximo'),//7

    Historia(tituloHistoria: 'Você observa o local e vê tanto uma janela ao lado da porta com uma cortina escura, quanto um portão aparentemente fechado '
        'que leva a parte de trás da casa.',
      escolha1: 'Abrir o portão e ir para a parte de trás da casa',
      escolha2: 'Olhar pela janela',), //8

    Historia(tituloHistoria: 'Após bater na porta dos fundos algumas vezes e não ter nenhuma resposta, PLAYER '
        'decidiu voltar no próximo dia. Percebendo que estava na mira dos investigadores reais, o dono da peculiar casa do subúrbio '
        'de Melenor fugiu para uma das cidades rurais do Reino, levando consigo as únicas informações que ajudariam você a completar sua missão.',
        escolha1: 'Fim do jogo. Você não alcançou seu objetivo.'),//9

    Historia(tituloHistoria: 'Você vê pela janela, em um canto escuro da sala, uma figura observando a porta na qual acabara de bater. Não há '
        'dúvida, a casa está habitada.',
      escolha1: 'Falar - "Estou vendo você aí, abra a porta"',
      escolha2: 'Chutar a porta',),//10

    Historia(tituloHistoria: 'A figura misteriosa lentamente caminha até a porta e a abre. Um homem grande, com cabelos negros o fita.',
      escolha1: 'Falar - "Você sabe por que estou aqui, vim buscar as informações que você tem sobre o assassinato do Rei."'),//11

    Historia(tituloHistoria: 'Você chuta a porta violentamente estraçalhando a fechadura. Em uma parte mais escura do local, '
        'uma figura grande de cabelos negros fita você com um semblante de medo',
        escolha1: 'Próximo'),//12

    Historia(tituloHistoria: '"Não adianta se esconder nas sombras, eu sabia que você estava aqui. Vim buscar as malditas '
        'informações que você tem sobre o assassinato do Rei" - Você brada em frente a porta',
        escolha1: 'Próximo'),//13

    Historia(tituloHistoria: '"Você está atrás da pessoa errada, eu não tenho as informações que você procura. Sou apenas um'
        ' humilde mercador de armas" - Diz a figura na sala.',
    escolha1: 'Falar - "Não adianta mentir para mim, meus informantes disseram que você estava próximo ao local quando tudo aconteceu".',
    escolha2: 'Blefar - "Você as tem, e não minta para mim. Eu sei que foi de você que vieram as adagas que mataram o Rei".',),//14

    Historia(tituloHistoria: '"Eu realmente não sei do que você está falando, como disse eu sou apenas um mercador. E se eles me viram lá eu '
        'provavelmente estava trabalhando. Por quê não investiga os outros vendedores também" - Diz o Homem',
      escolha1: 'Intimidar - "Você é um mercador de armas mas sou eu que sei usá-las, então é melhor abrir o jogo".',
      escolha2: 'Falar - "Por quê os meus informantes o viram falando com os suspeitos do assassinato".',),//15

    Historia(tituloHistoria: 'Com um semblante visivelmente assustado, o mercador fala "Tudo bem, não precisamos de violência. Eu acho que sei '
        'quem são as pessoas que você procura, eu soube que elas estão hospedadas na taverna Bar do Dourado.',
    escolha1: 'Observar seus arredores. "Essa informação parece ter vindo fácil demais" - Você pensa.',
    escolha2: 'Virar as costas e se dirigir o mais rápido possível à taverna que o homem falou.',),//16

    Historia(tituloHistoria: 'Você corre pelas ruas de Melenor, na esperança de encontrar os suspeitos na taverna que o homem mencionou. As estrelas'
        ' e a escuridão da noite começam a tomar os céus, e quanto mais tempo passa procurando pelo local, mais você percebe que foi enganado.',
        escolha1: 'Próximo'),

    Historia(tituloHistoria: 'Das ruas que antes eram quase vazias, alguns passos podem ser ouvidos vindo da escuridão. Dos becos passados você se'
        ' encontra em um sem saída. Atrás de você os passos ecoam e três figuras encapuzadas surgem da escuridão, portando adagas.',
        escolha1: 'Lutar',
        escolha2: 'Tentar fugir',),//

    Historia(tituloHistoria: 'Você sente seu sangue pulsando, adrenalina corre por suas veias e com um movimento rápido você saca sua espada. Todos'
        ' se preparam para uma batalha incerta.',
        escolha1: 'Final 2 de 3 da demo. Jogue mais para descobrir os outros.'),

    Historia(tituloHistoria: 'Você se prepara para uma investida contra os possíveis assassinos. Com um movimento rápido você corre em direção a eles,'
        ' inicialmente consegue passar por duas figuras mas o último lhe acerta um golpe na cabeça. E tudo escurece.',
        escolha1: 'Final 3 de 3 da demo. Jogue mais para descobrir os outros.'),

    Historia(tituloHistoria: '"O mercado de armas é muito movimentado durante o dia, eu não tenho como saber quem são os compradores e não posso vender '
        'meus produtos sem falar com os clientes." - Fala o mercador',
        escolha1: 'Observar o local em busca de pistas'),//21

    Historia(tituloHistoria: 'Você observa um local bagunçado, caixas de mercadorias se espalham pela sala principal e algumas armas jazem sobre uma mesa '
        'maior. Ao lado dos armamentos você avista um grande livro.',
        escolha1: 'Investigar as caixas',
        escolha2: 'Investigar o livro'),//22

    Historia(tituloHistoria: 'Você se aproxima de alguns caixotes semiabertos, dentro deles há apenas mercadorias e armas, nada que chame a atenção. Você '
        'decide Investigar o livro que havia sobre a mesa.',
        escolha1: 'Próximo'),//23

    Historia(tituloHistoria: 'Você abre um livro de registros, onde constam diversos nomes anotados ao decorrer dos dias. Você passa página por página, até'
        ' chegar no dia que os informantes lhe disseram que haviam visto o mercador conversando com clientes suspeitos.',
        escolha1: 'Próximo'),//24

    Historia(tituloHistoria: 'Ao observar atentamente cada nome anotado no dia do assassinato, você acaba percebendo um nome conhecido, um dos sacerdotes '
        'do templo de Zahar - Marcus Hector - mas apesar de reconhecer o nome você não tem muitas informações de quem ele é. Apenas sabe que ele habita o templo da ordem, que fica fora dos limites da cidade.',
        escolha1: 'Próximo'),//25

    Historia(tituloHistoria: 'PLAYER observa atentamente essas novas informações, e sem trocar muitas palavras parte em direção aos portões da cidade. Com cada '
        'vez mais determinação em desvendar os mistérios que envolvem este assassinato.',
        escolha1: 'Final 1 de 3 da demo. Jogue mais para descobrir os outros.'),//26

    Historia(tituloHistoria: '"Eu realmente não sabia disso, mas se você me acompanhar posso mostrar meu livro de registros. Lá você pode procurar por'
        ' alguém que tenha comprado alguma adaga" - Diz o mercador.',
        escolha1: 'Próximo'),//27

  ];

  bool eNarracao = true;



//funcões para deixar botoes invisiveis se for tela de narracao
  bool botaoVisivel() => eNarracao == false ? true : false;
  bool botaoVisivel2() {
    if(eNarracao == false && globais.Globais.numeroHistoria == 10){
      return false;
    }
    else if(eNarracao == false && globais.Globais.numeroHistoria == 14){
      return false;
    }
    else if(eNarracao == false && globais.Globais.numeroHistoria == 16){
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




  Historia get historia => dadosHistoria[globais.Globais.numeroHistoria];

  void proxHistoria(int numeroEscolha,Jogador jogador) {
    switch (jogador.historia) {
        case 0:
          globais.Globais.restartdemo = false;
          globais.Globais.numeroHistoria = 1;
          eNarracao = true;
          break;
        case 1:
          globais.Globais.numeroHistoria = 2;
          eNarracao = true;
          break;
        case 2:
          globais.Globais.numeroHistoria = 3;
          eNarracao = true;
          break;
        case 3:
          globais.Globais.numeroHistoria = 4;
          eNarracao = true;
          break;
        case 4:
          globais.Globais.numeroHistoria = 5;
          eNarracao = true;
          break;
        case 5:
          globais.Globais.numeroHistoria = 6;
          eNarracao = false;
          break;
        case 6: //Por ruas lamacentas
          if (numeroEscolha == 1) { //Bater à porta e esperar alguma resposta
            globais.Globais.numeroHistoria = 7;
            eNarracao = true;
            break;
          }
          else if (numeroEscolha == 2) { //Chutar a porta
            globais.Globais.numeroHistoria = 12;
            eNarracao = true;
            break;
          }
          break;
        case 7: //na chuva
          globais.Globais.numeroHistoria = 8;
          eNarracao = false;
          break;
        case 8: //Você observa portão e porta
          if (numeroEscolha == 1) { //Olhar pela janela
            globais.Globais.numeroHistoria = 9;
            eNarracao = true;
            break;
          }
          else if (numeroEscolha == 2) { //portão
            globais.Globais.numeroHistoria = 10;
            eNarracao = false;
            break;
          }
          break;
        case 9: //Fim precoce 1
          globais.Globais.numeroHistoria = 0;
          globais.Globais.restartdemo = true;
          eNarracao = true;
          Get.back();
          Get.to(() => TelaInicial());
          break;
        case 10: //Descriçao do personagem indo embora/tentativa em outro dia
          if (numeroEscolha == 1) { //Falar - "Estou vendo você aí, abra a porta"
            globais.Globais.numeroHistoria = 11;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //Chutar a porta
            globais.Globais.numeroHistoria = 12;
            eNarracao = true;
          }
          break;
        case 11: //A figura misteriosa lentamente
          globais.Globais.numeroHistoria = 14;
          eNarracao = false;
          break;
        case 12: //Você chuta a porta violentamente
          globais.Globais.numeroHistoria = 13;
          eNarracao = true;
          break;
        case 13: //Não adianta se esconder nas sombras
          globais.Globais.numeroHistoria = 14;
          eNarracao = false;
          break;
        case 14: // Você está atrás da pessoa errada,
          if (numeroEscolha == 1) { //Falar - "Não adianta mentir para mim,
            globais.Globais.numeroHistoria = 15;
            eNarracao = false;
          }
          else if (numeroEscolha == 2) { //Blefar - "Você as tem, e não minta para mim.
            globais.Globais.numeroHistoria = 27;
            eNarracao = true;
          }
          break;


        case 15: //Eu realmente não sei do que você está falando
          if (numeroEscolha == 1) { //Intimidar
            globais.Globais.numeroHistoria = 16;
            eNarracao = false;
          }
          else if (numeroEscolha == 2) { //Falar - "Por quê os meus informantes
            globais.Globais.numeroHistoria = 21;
            eNarracao = true;
          }
          break;
        case 16://Com um semblante visivelmente assustado
          if (numeroEscolha == 1) { //Observar seus arredores
            globais.Globais.numeroHistoria = 21;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //Virar as costas e se dirigir o mais
            globais.Globais.numeroHistoria = 17;
            eNarracao = true;
          }
          break;
        case 17:// Você corre pelas ruas de Melenor
          globais.Globais.numeroHistoria = 18;
          eNarracao = false;
          break;
        case 18: //Das ruas que antes eram quase vazias, alguns passos
          if (numeroEscolha == 1) { //Observar seus arredores
            globais.Globais.numeroHistoria = 19;
            eNarracao = true;
          }
          else if (numeroEscolha == 2) { //Virar as costas e se dirigir o mais
            globais.Globais.numeroHistoria = 20;
            eNarracao = true;
          }
          break;
        case 19: //Você sente seu sangue pulsando - fim 1
          globais.Globais.numeroHistoria = 0;
          globais.Globais.restartdemo = true;
          eNarracao = true;
          Get.back();
          Get.to(() => TelaInicial());
          break;
        case 20: //Você se prepara para uma investida contra - fim 2
          globais.Globais.numeroHistoria = 0;
          globais.Globais.restartdemo = true;
          eNarracao = true;
          Get.back();
          Get.to(() => TelaInicial());
          break;
      case 21: //O mercado de armas é muito movimentado
        globais.Globais.numeroHistoria = 22;
        eNarracao = false;
        break;
      case 22: //Você observa um local bagunçado
        if (numeroEscolha == 1) { //Investigar as caixas
          globais.Globais.numeroHistoria = 23;
          eNarracao = true;
        }
        else if (numeroEscolha == 2) { //Investigar o livro
          globais.Globais.numeroHistoria = 24;
          eNarracao = true;
        }
        break;
      case 23: //Você se aproxima de alguns caixotes semiabertos
        globais.Globais.numeroHistoria = 24;
        eNarracao = true;
        break;
      case 24: //Você abre um livro de registros
        globais.Globais.numeroHistoria = 25;
        eNarracao = true;
        break;
      case 25: //Ao observar atentamente cada nome anotado
        globais.Globais.numeroHistoria = 26;
        eNarracao = true;
        break;
      case 26: //PLAYER observa atentamente essas novas informações
        globais.Globais.numeroHistoria = 0;
        globais.Globais.restartdemo = true;
        eNarracao = true;
        Get.back();
        Get.to(() => TelaInicial());
        break;
      case 27: //Eu realmente não sabia disso, mas se você me acompanhar
        globais.Globais.numeroHistoria = 24;
        eNarracao = true;
        break;

      default:
        globais.Globais.numeroHistoria = 0;
        break;
    }


  }
}