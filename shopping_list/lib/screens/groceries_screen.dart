import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_items.dart';
import 'package:shopping_list/screens/new_grocery.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';

import 'package:http/http.dart' as http;

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({super.key});

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  void _loadItems() async {

    final url = Uri.https(
        "aprendiendoflutter-1add1-default-rtdb.firebaseio.com",
        "shopping-list.json");

    final response = await http.get(url);

    if(response.statusCode >= 400){
      setState(() {
        _error = "Failed to fetch data. Please try again later";
      });
    }

    if(response.body == "null") {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((i) => i.value.name == item.value["category"])
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value["name"],
          quantity: item.value["quantity"],
          category: category,
        ),
      );
    }

    setState(() {
       _groceryItems = loadedItems;
       _isLoading = false;
    });
   
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (context) => const NewGrocery()),
    );

    if(newItem == null){
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
        "aprendiendoflutter-1add1-default-rtdb.firebaseio.com",
        "shopping-list/${item.id}.json");
    
    http.delete(url);
  }

  @override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(_groceryItems[index]),
        onDismissed: (direction) {
          _removeItem(_groceryItems[index]);
        },
        child: GroceryListItem(
          grocery: _groceryItems[index],
        ),
      ),
    );

    if (_groceryItems.isEmpty) {
      content = Center(
        child: Text(
          "No groceries added yet",
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      );
    }

    if(_isLoading){
      content = const Center(child: CircularProgressIndicator(),);
    }

    if(_error != null){
      content = Center(
        child: Text(
          _error!,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
