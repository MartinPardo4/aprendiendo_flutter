import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/blocs/blocs.dart';

class PageIndexBloc extends Bloc<PageIndexEvent, PageIndexState>{

  PageIndexBloc() : super(const PageIndexState(pageIndex: 0)){
    on<SetPageIndexEvent>((event, emit) {
      emit(state.copyWith(pageIndex: event.selectedPageIndex));
    });
  }
}