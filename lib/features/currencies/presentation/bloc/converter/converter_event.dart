part of 'converter_bloc.dart';

sealed class ConverterEvent extends Equatable {
  const ConverterEvent();

  @override
  List<Object> get props => [];
}

class SetCurrenciesListEvent extends ConverterEvent {
  final List<Currency> currenciesList;
  const SetCurrenciesListEvent({required this.currenciesList});
}
