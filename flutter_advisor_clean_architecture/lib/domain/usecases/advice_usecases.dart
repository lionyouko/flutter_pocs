import 'package:dartz/dartz.dart';

import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/failures/failures.dart';
import 'package:flutter_advisor_clean_architecture/domain/repositories/advice_repository.dart';

class AdviceUseCases {
  AdviceUseCases({required this.adviceRepo});
  // we of course will use the abstract class / interface
  final AdviceRepository adviceRepo;

  // get data from a repository
  // proceed with business logic (any manipulation needed)
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
