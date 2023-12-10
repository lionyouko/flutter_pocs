import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final int id;
  final String advice;
  const AdviceEntity({required this.id, required this.advice});
  @override
  // TODO: implement props
  List<Object?> get props => [id, advice];
}
