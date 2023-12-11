import 'package:flutter_advisor_clean_architecture/domain/entities/advice_entity.dart';

//this is an interface
abstract class AdviceRepository {
  Future<AdviceEntity> getAdviceFromDataSource();
}
