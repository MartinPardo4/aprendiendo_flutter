import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 500,
            height: 100,
            child: TextField(
              minLines: null,
              maxLines: null,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.text_fields),
                label: Text(
                  "Ingrese un texto",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                ),
                prefixIconColor: Color.fromARGB(255, 100, 21, 180),
                filled: true,
                fillColor: Color(0xFFDDDDDD),
              ),
              style: TextStyle(
                  color: Color(0xAAFF4444),
                  fontWeight: FontWeight.bold,
              ),
              expands: true,
            ),
          ),
        )
      ),
    );
  }
}
