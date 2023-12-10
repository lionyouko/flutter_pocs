import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';

class AdviceUseCases {
  // get data from a repository
  // proceed with business logic (any manipulation needed)
  Future<AdviceEntity> getAdvice() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
    return const AdviceEntity(advice: 'advice from advice entity', id: 1);
  }
}
