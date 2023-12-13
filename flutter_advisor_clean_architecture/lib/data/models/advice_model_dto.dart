import 'package:equatable/equatable.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';

/// This extends [AdviceEntity] to add fromJSON method as DTO
class AdviceModelDTO extends AdviceEntity with EquatableMixin {
  AdviceModelDTO({required int id, required String advice})
      : super(advice: advice, id: id);

  factory AdviceModelDTO.fromJSON(Map<String, dynamic> json) {
    return AdviceModelDTO(
      id: json['advice_id'],
      advice: json['advice'],
    );
  }
}
