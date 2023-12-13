import 'package:dartz/dartz.dart';
import 'package:flutter_advisor_clean_architecture/data/datasources/advice_remote_datasource.dart';
import 'package:flutter_advisor_clean_architecture/data/exceptions/exception.dart';
import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_advisor_clean_architecture/domain/failures/failures.dart';
import 'package:flutter_advisor_clean_architecture/domain/repositories/advice_repository.dart';

class AdviceRepostoryImpl implements AdviceRepository {
  AdviceRepostoryImpl({required this.adviceRemoteDatasource});
  final AdviceRemoteDataSourceImpl adviceRemoteDatasource;

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromAPI();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on CacheException catch (_) {
      return left(CacheFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
