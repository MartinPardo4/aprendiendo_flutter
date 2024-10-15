import 'package:equatable/equatable.dart';
import 'package:meals_app/models/meal.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  
  @override
  List<Object?> get props => [];
}

class SetFavoriteEvent extends FavoritesEvent {
  final Meal meal;

  const SetFavoriteEvent(this.meal);

  @override
  List<Object?> get props => [meal];
}
