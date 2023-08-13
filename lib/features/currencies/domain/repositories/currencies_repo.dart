import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';

import '../../../../core/errors/failures.dart';

abstract class CurrenciesRepo extends Equatable {
  Future<Either<Failure, List<Currency>>> getAllCurrencies();
  Future<List<Currency>> getFilterdCurrencies(String search);
  Future<List<Currency>> getCachedCurrencies();
}
