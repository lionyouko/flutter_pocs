part of 'advice_bloc_bloc.dart';

//example here of need of equatable also (alongside with BLoC by itself)
//useful in tests
@immutable
sealed class AdviceBlocState extends Equatable {}

final class AdviceBlocInitialState extends AdviceBlocState {
  @override
  List<Object?> get props => [];
}

final class AdviceBlocLoadingSate extends AdviceBlocState {
  @override
  List<Object?> get props => [];
}

final class AdviceBlocLoadedState extends AdviceBlocState {
  final String advice;
  AdviceBlocLoadedState({required this.advice});

  @override
  List<Object?> get props => [advice];
}

final class AdviceBlocErrorState extends AdviceBlocState {
  final String message;
  AdviceBlocErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
