import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/usecases/advice_usecases.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerCubitInitial());

  final AdviceUseCases adviceUseCases = AdviceUseCases();
  //could also sje other usecases

  void onAdviceRequested() async {
    emit(AdviceCubitLoadingState());
    //execute business logic, for example, get an advice
    debugPrint('fake get advice');
    //for now just faking it, but better
    final AdviceEntity adviceGotten = await adviceUseCases.getAdvice();
    debugPrint('fake cubit advice gotten');
    emit(AdviceCubitLoadedState(advice: adviceGotten.advice));
  }
}
