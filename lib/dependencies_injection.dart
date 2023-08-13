import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_exchange/features/currencies/data/datasources/local_datasources.dart';
import 'package:my_exchange/features/currencies/data/datasources/remote_datasources.dart';
import 'package:my_exchange/features/currencies/data/repositories/currencies_repo_imp.dart';
import 'package:my_exchange/features/currencies/domain/repositories/currencies_repo.dart';
import 'package:my_exchange/features/currencies/domain/usecases/get_all_currencies_usecase.dart';
import 'package:my_exchange/features/currencies/domain/usecases/get_cached_currencies.dart';
import 'package:my_exchange/features/currencies/domain/usecases/get_filtered_currencies_usecase.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/converter/converter_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/currencies/currencies_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => CurrenciesBloc(
      getAllCurrenciesUsecase: sl(),
      getFilteredCurrenciesUsecase: sl(),
      getCachedCurrenciesUsecase: sl()));

  sl.registerFactory(() => ConverterBloc());
// Usecases

  sl.registerLazySingleton(() => GetAllCurrenciesUsecase(currenciesRepo: sl()));
  sl.registerLazySingleton(
      () => GetFilteredCurrenciesUsecase(currenciesRepo: sl()));
  sl.registerLazySingleton(
      () => GetCachedCurrenciesUsecase(currenciesRepo: sl()));

// Repository

  sl.registerLazySingleton<CurrenciesRepo>(() => CurrenciesRepoImp(
      remoteDatasource: sl(),
      localDatasource: sl(),
      internetConnectionChecker: sl()));

// Datasources

  sl.registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasourceImp(client: sl()));
  sl.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImp(sharedPreferences: sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
