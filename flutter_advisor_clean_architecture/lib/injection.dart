import 'package:flutter_advisor_clean_architecture/application/screens/advice/cubit/advicer_cubit.dart';
import 'package:flutter_advisor_clean_architecture/data/datasources/advice_remote_datasource.dart';
import 'package:flutter_advisor_clean_architecture/data/repositories/advice_repository_impl.dart';
import 'package:flutter_advisor_clean_architecture/domain/repositories/advice_repository.dart';
import 'package:flutter_advisor_clean_architecture/domain/usecases/advice_usecases.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl = service locator

Future<void> init() async {
  // register the classes we want to be located

  // application layer
  // Factory = every time a new/fresh instance of that class
  // You want fresh state always to call recent one
  sl.registerFactory(() => (AdvicerCubit(
      adviceUseCases:
          sl()))); // -> sl will take care of adviceUseCases as it will be registered too

  // domain layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  // data layer
  //inform service locator that it has many implementations
  sl.registerFactory<AdviceRepository>(
      () => AdviceRepostoryImpl(adviceRemoteDatasource: sl()));

  //inform service locator that it has many implementations
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDataSourceImpl(client: sl()));

  // external
  sl.registerFactory(() => http.Client());
}
