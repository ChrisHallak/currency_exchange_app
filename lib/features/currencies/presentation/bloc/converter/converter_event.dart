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

class ChooseCurrencyEvent extends ConverterEvent {
  final Key? key;
  final String? value;
  const ChooseCurrencyEvent({required this.value, required this.key});
}

class ConvertCurrencyEvent extends ConverterEvent {
  final Key? key;
  final String input;
  const ConvertCurrencyEvent({required this.key, required this.input});
}

class ClearEvent extends ConverterEvent {}
