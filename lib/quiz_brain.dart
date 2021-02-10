import 'questions.dart';

class QuizBrain{
  int _questionNumber = 0;
  bool _finished = false;

  List<Question> _questionKeeper = [
    Question(q: 'Beethoven is deaf',a: true),
    Question(q: 'Mozart has died at the aged 80',a: false),
    Question(q: 'Bach hasn\'t created any piano sonata',a: false),
    Question(q: 'Beethoven\'s written Symphony no.9',a: true),
    Question(q: 'Moonlight Sonata was written by Liszt',a: false),
    Question(q: 'Chopin has his hand and face masked',a: true),
    Question(q: 'Chopin has written one of the most well known piece \'nocturne op. 9 no. 2\'',a: true),
    Question(q: 'Mozart is more successful than Salieri',a: false),
    Question(q: 'During Napoleon\'s invasion against russia,Beethoven has finished Symphony no.7',a: true),
    Question(q: 'Beethoven has never listened any one of his pieces or notes',a: false),
    Question(q: 'Mozart\'s full name is \'Wolfgang Amadeus Mozart\'',a: false),
  ];

  void nextQuestion(){
    if(_questionNumber < _questionKeeper.length - 1){
      _questionNumber++;
    }
    else{
      _finished = true;
    }
  }

  String getQuestionText(){
    return _questionKeeper[_questionNumber].questionText;
  }
  bool getAnswer(){
    return _questionKeeper[_questionNumber].questionAnswer;
  }
  bool isFinished(){
    return _finished;
  }

  void reset(){
    _questionNumber = 0;
    _finished = false;
  }
}