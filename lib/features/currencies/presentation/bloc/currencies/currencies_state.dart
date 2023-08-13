part of 'currencies_bloc.dart';

sealed class CurrenciesState extends Equatable {
  const CurrenciesState();

  @override
  List<Object> get props => [];
}

final class CurrenciesInitial extends CurrenciesState {}

class GetAllCurrenciesLoadedState extends CurrenciesState {
  final List<Currency> allCurrencies;

  const GetAllCurrenciesLoadedState({required this.allCurrencies});
}

class LoadingState extends CurrenciesState {}

class GetAllCurrenciesErrorState extends CurrenciesState {
  final String message;

  const GetAllCurrenciesErrorState({required this.message});
}

class GetFilteredCurrenciesLoadedState extends CurrenciesState {
  final List<Currency> filteredCurrencies;
  const GetFilteredCurrenciesLoadedState({required this.filteredCurrencies});
}
