

import 'package:equatable/equatable.dart';
import 'package:meals_app/blocs/filter/filters_bloc.dart';


class FiltersState extends Equatable {
  final Map<Filter, bool> filters;

  const FiltersState({
    required this.filters,
  });

  factory FiltersState.initial() {
    return const FiltersState(filters: {
      Filter.glutenFree: false,
      Filter.lactoseFree: false,
      Filter.vegetarian: false,
      Filter.vegan: false,
    });
  }


  FiltersState copyWith({Map<Filter, bool>? filters}) {
    return FiltersState(filters: filters ?? this.filters);
  }

  @override
  List<Object?> get props => [filters];
}
