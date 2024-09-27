import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{

  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (e) =>
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.circle,
                        size: 30,
                        color: e["selected_answer"] == e["correct_answer"] ? Colors.green : Colors.red ,
                      ),
                    ),
                    Text(
                      ((e["question_index"] as int) + 1).toString(),
                    ) 
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        e["question"] as String,
                        style: GoogleFonts.rubik(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 200, 150, 220),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        e["selected_answer"] as String,
                        style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: const Color.fromARGB(111, 255, 255, 255),
        
                        ),
        
                        ),
                      Text(
                        e["correct_answer"] as String,
                          style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: const Color.fromARGB(111, 255, 255, 255),
        
                          )
                      ),
                    ],
                          
                  ),
                )
              ],
            ),
          ).toList(),
        ),
      ),
    );
  }

}