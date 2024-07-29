class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    // se crea la copia de la lista
    final shuffledList = List.of(answers);
    // se baraja la lista
    shuffledList.shuffle();

    // se regresa la lista barajada
    return shuffledList;
  }
}
