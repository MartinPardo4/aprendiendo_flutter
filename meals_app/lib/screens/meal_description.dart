import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/blocs/blocs.dart';
import 'package:meals_app/models/meal.dart';


class MealDescriptionScreen extends StatelessWidget{
  const MealDescriptionScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    //final favoriteMeals = ref.watch(favoriteMealsProvider);
    

    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (ctx, state) {

        final isFavorite = state.favoriteMeals.contains(meal);

        return Scaffold(
          appBar: AppBar(
            title: Text(meal.title),
            actions: [
              IconButton(
                onPressed: () {
                  ctx.read<FavoritesBloc>().add(SetFavoriteEvent(meal));
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => RotationTransition(
                    turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                    child: child,
                  ),
                  child: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    key: ValueKey(isFavorite),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  height: 200,
                  width: double.infinity,
                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
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
    );
  }
}
