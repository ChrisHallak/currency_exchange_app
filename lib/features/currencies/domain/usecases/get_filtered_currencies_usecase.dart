import 'package:equatable/equatable.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/domain/repositories/currencies_repo.dart';

class GetFilteredCurrenciesUsecase extends Equatable {
  final CurrenciesRepo currenciesRepo;
  const GetFilteredCurrenciesUsecase({required this.currenciesRepo});

  @override
  List<Object?> get props => throw UnimplementedError();

  Future<List<Currency>> call(String value) {
    return currenciesRepo.getFilterdCurrencies(value);
  }
}
