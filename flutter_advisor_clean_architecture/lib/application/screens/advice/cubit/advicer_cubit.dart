import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/failures/failures.dart';
import 'package:flutter_advisor_clean_architecture/domain/usecases/advice_usecases.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit({required this.adviceUseCases}) : super(AdvicerCubitInitial());

  final AdviceUseCases adviceUseCases;
  //could also sje other usecases

  void onAdviceRequested() async {
    emit(AdviceCubitLoadingState());
    //execute business logic, for example, get an advice
    debugPrint('fake get advice');
    //for now just faking it, but better
    final adviceOrFailureGotten = await adviceUseCases.getAdvice();
    adviceOrFailureGotten.fold(
      (failure) => {
        emit(
          AdviceCubitErrorState(
            message: _mapFailureToMessage(failure),
          ),
        ),
      },
      (advice) {
        debugPrint('fake cubit advice gotten');
        emit(
          AdviceCubitLoadedState(advice: advice.advice),
        );
      },
    );
  }

  //serves only for the mapping of failures to messages to user
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return kServerFailureMessage;
      case CacheFailure:
        return kCacheFailureMessage;
      case GeneralFailure:
        return kGeneralFailureMessage;
      default:
        return kUnknownFailureMessage;
    }
  }
}
