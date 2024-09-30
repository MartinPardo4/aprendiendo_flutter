import 'package:flutter/material.dart';
import 'package:juego_quiz/data/questions.dart';
import 'package:juego_quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen(this.restartQuiz, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData(){

    List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++){

      summary.add({
        "question_index": i,
        "question":  questions[i].text,
        "selected_answer": chosenAnswers[i],
        "correct_answer": questions[i].answers[0],
      });
    }


    return summary;
  }

  @override
  Widget build(BuildContext context) {
    
    final summaryData = getSummaryData();
    final totalQuestions = summaryData.length;
    final correctAnswers = summaryData.where((element) =>
    element["selected_answer"] == element["correct_answer"]
    ).length;
    
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $correctAnswers out of $totalQuestions questions correctly!"),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(
              onPressed: restartQuiz,
              child: const Text("Restart Quiz")),
          ],
        ),
      ),
    );
    
  }

}