import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_items.dart';

class GroceryListItem extends StatelessWidget{

  const GroceryListItem({super.key, required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            color: grocery.category.color,
          ),
          const SizedBox(width: 15,),
          Text(grocery.name),
          const Spacer(),
          Text("${grocery.quantity}"), 
        ],
      ),
    );
  }
}