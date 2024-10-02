import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: value, 
            onChanged: onChanged,
            title: Text("Gluten-free", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),),
            subtitle: Text("Only include gluten-free meals", style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),),
            activeColor: ,
          ),
        ],),
    );
  }
}
