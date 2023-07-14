import 'multi_quistions.dart';

class QuizBrain {
  final List<MultiQuestion> _multiquestionBrain = [
    MultiQuestion(
      questionText: 'what is the lagest city',
      questionAnswer: 'Jerusalem',
      answer_1: 'GAZA',
      answer_2: 'nablus',
      answer_3: 'Jerusalem',
    ),

    //    options: ['Gaza', 'nablus', 'Jerusalem']),
    MultiQuestion(
      questionText: 'what is the capital of palestione city',
      questionAnswer: 'Jerusalem',
      answer_1: 'Jerusalem',
      answer_2: 'Cairo',
      answer_3: 'new york',
    ),
    MultiQuestion(
      questionText: 'what is color of wood',
      questionAnswer: 'brown',
      answer_1: 'pink',
      answer_2: 'brown',
      answer_3: 'white',
    ),
  ];
  int _questionNumber = 0;
  int _score = 0;

  String getQuestion() {
    return _multiquestionBrain[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _multiquestionBrain[_questionNumber].questionAnswer;
  }

  // int getIndexOfList() {
  //   return _multiquestionBrain[_questionNumber]
  //       .options
  //       .indexOf(getOptions(_questionNumber));
  // }

  String getAnswer1() {
    return _multiquestionBrain[_questionNumber].answer_1;
  }

  String getAnswer2() {
    return _multiquestionBrain[_questionNumber].answer_2;
  }

  String getAnswer3() {
    return _multiquestionBrain[_questionNumber].answer_3;
  }

  void nextQuestion() {
    _questionNumber++;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  bool isFinished() {
    if (_questionNumber >= _multiquestionBrain.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastQuestion() {
    if (_questionNumber == _multiquestionBrain.length - 1)
      return true;
    else
      return false;
  }

  void calculateScore() {
    _score++;
  }

  int getScore() {
    return _score;
  }

  reset() {
    _questionNumber = 0;
    _score = 0;
  }
}
