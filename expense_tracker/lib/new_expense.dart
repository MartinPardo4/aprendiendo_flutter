import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _expenseDate;
  var _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount < 0;

    if(_titleController.text.trim().isEmpty || amountIsInvalid || _expenseDate == null){
      showDialog(
        context: context, 
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Data"),
          content: const Text("Please make sure you entered a valid data."),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(ctx);
              }, 
              child: const Text("Accept"),
            ),
          ],
        )
      );
      return;
    }
  widget.onAddExpense(
    Expense(
      title: _titleController.text.trim(), 
      amount: enteredAmount, 
      date: _expenseDate!, 
      category: _selectedCategory
    )
  );
  Navigator.pop(context);

  } 

  void _presentDatePicker() async {
    var now = DateTime.now();
    var firsDate = DateTime(now.year - 1, now.month, now.day);
    var selectedDate = await showDatePicker(
      context: context, 
      initialDate: now, 
      firstDate: firsDate, 
      lastDate: now
    );
    setState(() {
      _expenseDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  //maxLength: 25,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text("Amount"),
                  ),
               ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _expenseDate == null
                      ? "No Selected Date" 
                      : format.format(_expenseDate!),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker, 
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name)
                  )
                ).toList(),
                onChanged: (value){
                  if(value == null){
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Submit"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
