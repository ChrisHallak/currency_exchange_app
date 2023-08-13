import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/domain/repositories/currencies_repo.dart';

import '../../../../core/errors/failures.dart';

class GetAllCurrenciesUsecase extends Equatable {
  final CurrenciesRepo currenciesRepo;
  const GetAllCurrenciesUsecase({required this.currenciesRepo});

  @override
  List<Object?> get props => throw UnimplementedError();

  Future<Either<Failure, List<Currency>>> call() {
    return currenciesRepo.getAllCurrencies();
  }
}
