import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>>{

  FavoritesNotifier() : super([]);

  void toggleMealFavorite(Meal meal) {

    final isFavorite = state.contains(meal);

    if(isFavorite){
      state.remove(meal);
    }
    else{
      state.add(meal);
    }
  }
}

final favoritesMealProvider = StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref){
  return FavoritesNotifier();
});