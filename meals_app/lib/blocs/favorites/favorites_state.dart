

import 'package:equatable/equatable.dart';
import 'package:meals_app/models/meal.dart';


class FavoritesState extends Equatable {
  final List<Meal> favoriteMeals;

  const FavoritesState({
    required this.favoriteMeals,
  });


  FavoritesState copyWith({List<Meal>? favorites}) {
    return FavoritesState(favoriteMeals: favorites ?? this.favoriteMeals);
  }

  @override
  List<Object?> get props => [favoriteMeals];
}