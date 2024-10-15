
import 'package:meals_app/blocs/blocs.dart';
import 'package:meals_app/data/dummy_data.dart';

// ignore: prefer_function_declarations_over_variables
final filteredMeals = (FiltersState state) {
  return dummyMeals.where((meal) {
    if (state.filters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (state.filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (state.filters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (state.filters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
};