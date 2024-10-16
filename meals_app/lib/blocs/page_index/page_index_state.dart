
import 'package:equatable/equatable.dart';


class PageIndexState extends Equatable {
  final int pageIndex;

  const PageIndexState({
    required this.pageIndex,
  });


  PageIndexState copyWith({int? pageIndex}) {
    return PageIndexState(pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object?> get props => [pageIndex];
}