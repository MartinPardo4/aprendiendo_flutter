import 'package:equatable/equatable.dart';

abstract class PageIndexEvent extends Equatable {
  const PageIndexEvent();
  
  @override
  List<Object?> get props => [];
}

class SetPageIndexEvent extends PageIndexEvent {
  final int selectedPageIndex;

  const SetPageIndexEvent(this.selectedPageIndex);

  @override
  List<Object?> get props => [selectedPageIndex];
}
