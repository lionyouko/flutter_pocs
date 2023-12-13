import 'package:dartz/dartz.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/failures/failures.dart';

//this is an interface for concrete repos in datalayer
abstract class AdviceRepository {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}
