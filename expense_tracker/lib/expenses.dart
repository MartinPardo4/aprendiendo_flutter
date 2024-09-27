import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "MacDonalds",
        amount: 5000,
        date: DateTime.now(),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("TITULO"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses,),
          )
        ],
      ),
    );
  }
}
