import 'package:dartz/dartz.dart';
import 'package:flutter_advisor_clean_architecture/data/repositories/advice_repository_impl.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/failures/failures.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepostoryImpl();
  // get data from a repository
  // proceed with business logic (any manipulation needed)
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
