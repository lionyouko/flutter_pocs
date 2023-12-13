import 'package:dartz/dartz.dart';
import 'package:flutter_advisor_clean_architecture/data/datasources/advice_remote_datasource.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/failures/failures.dart';
import 'package:flutter_advisor_clean_architecture/domain/repositories/advice_repository.dart';

class AdviceRepostoryImpl implements AdviceRepository {
  final adviceRemoteDatasource = AdviceRemoteDataSourceImpl();

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    final result = await adviceRemoteDatasource.getRandomAdviceFromAPI();
    return right(result);
  }
}
