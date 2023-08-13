part of 'currencies_bloc.dart';

sealed class CurrenciesEvent extends Equatable {
  const CurrenciesEvent();

  @override
  List<Object> get props => [];
}

class GetAllCurrenciesEvent extends CurrenciesEvent {}

class GetFilteredCurrenciesEvent extends CurrenciesEvent {
  final String search;
  GetFilteredCurrenciesEvent({required this.search});
}
