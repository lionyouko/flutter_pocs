import 'package:dartz/dartz.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/failures/failures.dart';

class AdviceUseCases {
  // get data from a repository
  // proceed with business logic (any manipulation needed)
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {},
    );
    // call to repo went okay -> return data is not failure
    return right(
        const AdviceEntity(advice: 'advice from advice entity', id: 1));

    // return left(ServerFailure());
  }
}
