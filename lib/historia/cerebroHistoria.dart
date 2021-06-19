import 'historia.dart';

class cerebroHistoria {
  List<Historia> _dadosHistoria = [
    Historia(
        tituloHistoria: '',
        escolha1: 'I\'ll hop in. Thanks for the help!',
        escolha2: 'Better ask him if he\'s a murderer first.'),
    Historia(
        tituloHistoria: '',
        escolha1: 'At least he\'s honest. I\'ll chlimb in.',
        escolha2: 'Wait, I know how to change a tire.'),
    Historia(
        tituloHistoria:
        'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        escolha1: 'I love Elton John! Hand him the cassette tape.',
        escolha2: 'It\'s him or me! You take the knife and stab him.'),
    Historia(
        tituloHistoria:
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        escolha1: 'Restart',
        escolha2: ''),
    Historia(
        tituloHistoria:
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        escolha1: 'Restart',
        escolha2: ''),
    Historia(
        tituloHistoria:
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        escolha1: 'Restart',
        escolha2: '')
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