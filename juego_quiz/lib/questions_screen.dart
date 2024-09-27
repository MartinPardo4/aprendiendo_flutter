import 'package:flutter/material.dart';
import 'package:juego_quiz/data/questions.dart';
import 'package:juego_quiz/models/buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{

  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() => _QuestionScreenState();

}

class _QuestionScreenState extends State<QuestionsScreen>{

  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
      setState(() {
        
        widget.onSelectedAnswer(answer);
        currentQuestionIndex++;
      
      });
  }
    

  

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.rubik(
                color: const Color.fromARGB(255, 202, 131, 243),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffeldAnswers().map(
              (answer) => 
              AnswerButton(
                answerText: answer,
                onTap:() {
                  answerQuestion(answer);
                }
              )
            ),
          ],
        ),
      )
    );
  }
}