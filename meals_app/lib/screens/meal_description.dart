import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDescriptionScreen extends StatelessWidget {
  const MealDescriptionScreen({
    super.key,
    required this.meal,
    required this.onToggledFavorite
  });

  final Meal meal;
  final void Function(Meal meal) onToggledFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggledFavorite(meal), 
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            meal.imageUrl,
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 16),
          ...meal.ingredients.map(
            (ingredient) => Text(
              ingredient,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Steps",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          ...meal.steps.map(
            (step) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
