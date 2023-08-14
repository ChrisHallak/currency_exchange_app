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
  final int chooseOne;
  const ConvertCurrencyEvent({required this.key, required this.input,required this.chooseOne});
}

class ClearEvent extends ConverterEvent {}

class SwitchEvent extends ConverterEvent {
  final bool switchIndex;
  const SwitchEvent({required this.switchIndex});
}

class ConverterResetEvent extends ConverterEvent {}
