import 'historia.dart';

class cerebroHistoria {
  List<Historia> _storyData = [
    Historia(
        _tituloHistoria:
        '".',
        _escolha1: 'I\'ll hop in. Thanks for the help!',
        _escolha2: 'Better ask him if he\'s a murderer first.'),
    Historia(
        _tituloHistoria: '',
        _escolha1: 'At least he\'s honest. I\'ll chlimb in.',
        _escolha2: 'Wait, I know how to change a tire.'),
    Historia(
        _tituloHistoria:
        'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        _escolha1: 'I love Elton John! Hand him the cassette tape.',
        _escolha2: 'It\'s him or me! You take the knife and stab him.'),
    Historia(
        _tituloHistoria:
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        _escolha1: 'Restart',
        _escolha2: ''),
    Historia(
        _tituloHistoria:
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        _escolha1: 'Restart',
        _escolha2: ''),
    Historia(
        _tituloHistoria:
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        _escolha1: 'Restart',
        _escolha2: '')
  ];

  Historia get story => _storyData[_numeroHisoria];

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
      default:
        _numeroHisoria = 0;
        break;
    }
  }
}