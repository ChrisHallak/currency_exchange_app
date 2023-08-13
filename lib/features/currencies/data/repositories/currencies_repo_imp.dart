import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_exchange/core/errors/exceptions.dart';
import 'package:my_exchange/core/errors/failures.dart';
import 'package:my_exchange/features/currencies/data/datasources/local_datasources.dart';
import 'package:my_exchange/features/currencies/data/datasources/remote_datasources.dart';
import 'package:my_exchange/features/currencies/data/models/currency_model.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/domain/repositories/currencies_repo.dart';

class CurrenciesRepoImp implements CurrenciesRepo {
  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;
  final InternetConnectionChecker internetConnectionChecker;
  CurrenciesRepoImp(
      {required this.remoteDatasource,
      required this.localDatasource,
      required this.internetConnectionChecker});

  @override
  Future<Either<Failure, List<Currency>>> getAllCurrencies() async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        List<CurrencyModel> allCurrenciesModels =
            await remoteDatasource.getAllCurrencies();
        localDatasource.cacheCurrencies(allCurrenciesModels);
        return right(allCurrenciesModels);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        List<CurrencyModel> allCurrenciesModels =
            await localDatasource.getCachedCurrencies();
        return right(allCurrenciesModels);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<List<Currency>> getFilterdCurrencies(String search) async {
    List<CurrencyModel> allCurrenciesModels =
        await localDatasource.getCachedCurrencies();
    final filterdCurrencies = allCurrenciesModels.where((currency) {
      final codeLower = currency.code.toLowerCase();
      final searchLower = search.toLowerCase();
      return codeLower.contains(searchLower);
    }).toList();

    return filterdCurrencies;
  }

  @override
  Future<List<Currency>> getCachedCurrencies() async {
    try {
      List<CurrencyModel> allCurrenciesModels =
          await localDatasource.getCachedCurrencies();
      return allCurrenciesModels;
    } on EmptyCacheException {
      print('empy cache ');
      return [];
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
