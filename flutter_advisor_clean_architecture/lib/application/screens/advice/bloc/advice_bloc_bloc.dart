import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_bloc_event.dart';
part 'advice_bloc_state.dart';

class AdviceBloc extends Bloc<AdviceBlocEvent, AdviceBlocState> {
  AdviceBloc() : super(AdviceBlocInitialState()) {
    //example event when create a class
    // on<AdviceBlocEvent>((event, emit) {

    // });

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceBlocLoadingSate());
      //execute business logic, for example, get an advice
      debugPrint('fake get advice');
      //for now just faking it
      await Future.delayed(
        const Duration(seconds: 2),
        () {},
      );
      debugPrint('fake advice gotten');
      emit(AdviceBlocLoadedState(advice: 'fake advice gotten'));
    });
  }
}
