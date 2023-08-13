import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_exchange/core/errors/failures.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/domain/repositories/currencies_repo.dart';

class GetCachedCurrenciesUsecase extends Equatable {
  final CurrenciesRepo currenciesRepo;
  const GetCachedCurrenciesUsecase({required this.currenciesRepo});

  @override
  List<Object?> get props => throw UnimplementedError();

  Future<List<Currency>> call() {
    return currenciesRepo.getCachedCurrencies();
  }
}
