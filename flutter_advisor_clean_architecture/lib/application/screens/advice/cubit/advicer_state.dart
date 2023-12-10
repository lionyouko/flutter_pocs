part of 'advicer_cubit.dart';

sealed class AdvicerCubitState extends Equatable {
  const AdvicerCubitState();

  @override
  List<Object?> get props => [];
}

final class AdvicerCubitInitial extends AdvicerCubitState {
  @override
  List<Object?> get props => [];
}

final class AdviceCubitLoadingSate extends AdvicerCubitState {
  @override
  List<Object?> get props => [];
}

final class AdviceCubitLoadedState extends AdvicerCubitState {
  final String advice;
  const AdviceCubitLoadedState({required this.advice});

  @override
  List<Object?> get props => [advice];
}

final class AdviceCubitErrorState extends AdvicerCubitState {
  final String message;
  const AdviceCubitErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
