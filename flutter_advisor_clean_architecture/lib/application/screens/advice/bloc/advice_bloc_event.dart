part of 'advice_bloc_bloc.dart';

//example here of need of equatable also (alongside with BLoC by itself)
//useful in tests
@immutable
sealed class AdviceBlocEvent extends Equatable {}

class AdviceRequestedEvent extends AdviceBlocEvent {
  @override
  List<Object?> get props => [];
}
