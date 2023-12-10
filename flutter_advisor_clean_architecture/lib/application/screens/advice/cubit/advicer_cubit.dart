import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerCubitInitial());

  void onAdviceRequested() async {
    emit(AdviceCubitLoadingSate());
    //execute business logic, for example, get an advice
    debugPrint('fake get advice');
    //for now just faking it
    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
    debugPrint('fake cubit advice gotten');
    emit(const AdviceCubitLoadedState(advice: 'fake cubit advice gotten'));
  }
}
