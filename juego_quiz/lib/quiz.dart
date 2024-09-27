
import 'package:flutter/material.dart';
import 'package:juego_quiz/data/questions.dart';
import 'package:juego_quiz/questions_screen.dart';
import 'package:juego_quiz/results_screen.dart';
import 'package:juego_quiz/start_screen.dart';

class Quiz extends StatefulWidget{

  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();

}

class _QuizState extends State<Quiz>{

  Widget? currentScreen;
  final List<String> _selectedAnswers = [];

  @override
  void initState() {
    currentScreen = StartScreen(startQuiz);
    super.initState();
  }

  void chooseAnswer(String answer){

    _selectedAnswers.add(answer);
    if(_selectedAnswers.length == questions.length){

      setState(() {
        currentScreen = ResultsScreen(restartQuiz, chosenAnswers: _selectedAnswers);
      });
    }
  }

  void startQuiz(){
    setState(() {
      currentScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer,);
    });
  }

  void restartQuiz(){
    setState(() {
      //_selectedAnswers.clear();
      currentScreen = StartScreen(startQuiz);
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 56, 24, 150)),
          child: Center(
            child: currentScreen,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}