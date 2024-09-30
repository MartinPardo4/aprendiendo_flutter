import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';


final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 180, 100, 20),
);
final kColorDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 20, 70, 140),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kColorDarkScheme,
         appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorDarkScheme.onPrimaryContainer,
          foregroundColor: kColorDarkScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorDarkScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          elevation: 15,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorDarkScheme.onSecondary,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          bodyLarge: TextStyle(
            fontSize: 18,
            color: kColorDarkScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: kColorDarkScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),    
          labelLarge: TextStyle(
            color: kColorDarkScheme.onPrimaryContainer,
            fontSize: 18,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: kColorDarkScheme.primaryContainer,
        )  
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          elevation: 15,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onSecondary,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          bodyLarge: TextStyle(
            fontSize: 18,
            color: kColorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: kColorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),    
          labelLarge: TextStyle(
            color: kColorScheme.onPrimaryContainer,
            fontSize: 18,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
        )  
      ),
      home: const Expenses(),
      debugShowCheckedModeBanner: false,
    );
  }
}
