import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/blocs/filter/filters_event.dart';
import 'package:meals_app/blocs/filter/filters_state.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersBloc extends Bloc<FiltersEvent, FiltersState>{

  FiltersBloc() : super(FiltersState.initial()){
    on<SetFilterEvent>(_onSetFilter);
    on<SetFiltersEvent>(_onSetFilters);


  }
  void _onSetFilter(SetFilterEvent event, Emitter<FiltersState> emit) {
    final updatedFilters = {
      ...state.filters,
      event.filter: event.isActive,
    };
    
    emit(state.copyWith(filters: updatedFilters));
    
  }

  void _onSetFilters(SetFiltersEvent event, Emitter<FiltersState> emit) {
    emit(state.copyWith(filters: event.filters));
  }
}

// ignore: prefer_function_declarations_over_variables
