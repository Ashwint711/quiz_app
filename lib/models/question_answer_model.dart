class QuestionAnswerModel {
  const QuestionAnswerModel(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> get shuffledAnswer {
    final List<String> shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
