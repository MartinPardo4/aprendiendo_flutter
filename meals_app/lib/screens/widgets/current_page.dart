import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/blocs/blocs.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals_screen.dart';

class CurrentPage extends StatelessWidget {
  final int selectedPageIndex;

  const CurrentPage({super.key, required this.selectedPageIndex});

  @override
  Widget build(BuildContext context) {
    if (selectedPageIndex == 1) {
      return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          final favoriteMeals = state.favoriteMeals;

          return MealsScreen(
            meals: favoriteMeals,
          );
        },
      );
    }

    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        final meals = filteredMeals(state);

        return CategoriesScreen(
          availableMeals: meals,
        );
      },
    );
  }
}
