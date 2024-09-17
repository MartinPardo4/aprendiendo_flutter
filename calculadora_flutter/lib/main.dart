import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Calculadora(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _input = '';
  String _resultado = '';

  // Función para manejar las pulsaciones de botones
  void _onButtonPressed(String text) {
    setState(() {
      if (text == 'C') {
        _input = '';
        _resultado = '';
      } else if (text == '=') {
        try {
          _resultado = _calcularResultado(_input);
        } catch (e) {
          _resultado = 'Error';
        }
      } else if((text == 'sqrt' || text == 'pow')){
        if(_resultado.isNotEmpty){
          if(text == 'sqrt'){
             _input = "sqrt($_resultado)";
          } else{
            _input = "$_resultado^";
          }
          _resultado = "";
        } else if(_input.isNotEmpty){
          if(text == 'sqrt'){
             _input = "sqrt($_input)";
          } else{
            _input += "^";
          }
        }
      }
      else {
        if(_resultado.isNotEmpty){
          if(['+', '-', '/', '*'].contains(text)){
            _input = _resultado;
            _resultado = "";
          }
          else{
            _input = "";
            _resultado = "";
          }
        }
        _input += text;
      }
    });
  }

  // Función para realizar el cálculo
  String _calcularResultado(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      if(eval == eval.truncate()){
        return eval.toInt().toString();
      }
      return eval.toString();

    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora'.toUpperCase(), 
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 30),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _input,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  _resultado,
                  style: const TextStyle(fontSize: 36, color: Colors.blue),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: _buildBotones(),
          )
        ],
      ),
    );
  }

  // Construir los botones de la calculadora
  Widget _buildBotones() {
    return Column(
      children: [
        _buildFilaBotones(['7', '8', '9', '/']),
        _buildFilaBotones(['4', '5', '6', '*']),
        _buildFilaBotones(['1', '2', '3', '-']),
        _buildFilaBotones(['0', '=', '+', 'C']),
        _buildFilaBotones(['.', 'sqrt', 'pow']),
      ],
    );
  }

  Widget _buildFilaBotones(List<String> botones) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: botones.map((text) {
        return _buildBoton(text);
      }).toList(),
    );
  }

  Widget _buildBoton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(text),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          minimumSize: const Size(70, 70),
        ),
        child: Text(text, style: const TextStyle(fontSize: 40)),
      ),
    );
  }
}
