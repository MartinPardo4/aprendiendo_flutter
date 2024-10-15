import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/blocs/blocs.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState>{

  FavoritesBloc() : super(const FavoritesState(favoriteMeals: [])){
    on<SetFavoriteEvent>(_toggleMealFavorite);
  }

   void _toggleMealFavorite(SetFavoriteEvent event, Emitter<FavoritesState> emit) {

    final isFavorite = state.favoriteMeals.contains(event.meal);
    List<Meal> updatedFavorites;

    if(isFavorite){
      updatedFavorites = state.favoriteMeals.where((m) => m.id != event.meal.id).toList();
    }
    else{
      updatedFavorites = [...state.favoriteMeals, event.meal];
    }

    emit(state.copyWith(favorites: updatedFavorites));
  }
}