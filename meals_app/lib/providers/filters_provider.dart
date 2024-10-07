import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider((ref) => dummyMeals.where(
      (meal) {
        final filters = ref.watch(filtersProvider);
        if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (filters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList());
