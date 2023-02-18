import 'package:quizler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true),
    Question(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Question(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    Question(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Question(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Question(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Question(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Question(
        question: 'Google was originally called \"Backrub\".', answer: true),
    Question(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    Question(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length) _questionNumber++;
  }

  bool get hasNextQuestion {
    return _questionNumber < _questions.length;
  }

  Question getQuestion() {
    return _questions[_questionNumber];
  }

  String get question {
    return hasNextQuestion
        ? _questions[_questionNumber].question
        : _questions[_questions.length - 1].question;
  }

  bool isAnswerCorrect(bool ans) {
    return getQuestion().isCorrect(ans);
  }

  int get size {
    return _questions.length;
  }

  reset() {
    _questionNumber = 0;
  }
}
