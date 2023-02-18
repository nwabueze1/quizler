class Question {
  final String question;
  final bool _answer;

  bool get answer => _answer;

  Question({required this.question, required bool answer}) : _answer = answer;

  bool isCorrect(bool ans) {
    return answer == ans;
  }
}
