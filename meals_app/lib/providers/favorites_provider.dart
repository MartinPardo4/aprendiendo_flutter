import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>>{

  FavoritesNotifier() : super([]);

  void toggleMealFavorite(Meal meal) {

    final isFavorite = state.contains(meal);

    if(isFavorite){
      state = state.where((m) => m.id != meal.id).toList();
    }
    else{
      state = [...state, meal];
    }
  }
}

final favoritesMealProvider = StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref){
  return FavoritesNotifier();
});