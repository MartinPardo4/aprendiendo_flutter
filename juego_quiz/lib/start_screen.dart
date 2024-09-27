import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final String imagenFlutter = 'assets/images/quiz-logo.png';
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagenFlutter,
          width: 200,
          color: const Color.fromARGB(130, 255, 255, 255),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Learn Flutter the fun way !",
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: startQuiz,
          icon: const Icon(Icons.start),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            foregroundColor: WidgetStateProperty.all(
                const Color.fromARGB(255, 99, 12, 204)),
          ),
          label: const Text(
            'Start Quiz',
          ),
        ),
      ],
    );
  }
}
