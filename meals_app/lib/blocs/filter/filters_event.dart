

import 'package:equatable/equatable.dart';
import 'package:meals_app/blocs/filter/filters_bloc.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();
  
  @override
  List<Object?> get props => [];
}

class SetFilterEvent extends FiltersEvent {
  final Filter filter;
  final bool isActive;

  const SetFilterEvent(this.filter, this.isActive);

  @override
  List<Object?> get props => [filter, isActive];
}

class SetFiltersEvent extends FiltersEvent {
  final Map<Filter, bool> filters;

  const SetFiltersEvent(this.filters);

  @override
  List<Object?> get props => [filters];
}
