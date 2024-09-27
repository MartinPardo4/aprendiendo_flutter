class Question{

  const Question({required this.text, required this.answers});

  final String text;
  final List<String> answers;

  List<String> getShuffeldAnswers(){

    var shuffeledAnswers = List.of(answers);
    shuffeledAnswers.shuffle();
    return shuffeledAnswers;
  }

}