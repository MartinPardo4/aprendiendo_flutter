import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

  const AnswerButton({ required this.answerText, required this.onTap, super.key});

  final String answerText;
  final void Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 50, 25, 110),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center
        ),
      ),
    );
  }

}