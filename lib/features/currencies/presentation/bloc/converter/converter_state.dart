part of 'converter_bloc.dart';

sealed class ConverterState {
  const ConverterState();
}

final class ConverterInitial extends ConverterState {}

final class CurrenciesListState extends ConverterState {}

final class CurrencyChoosenState extends ConverterState {
  String? currency;
  CurrencyChoosenState({required this.currency});
}

class CurrencyConvertedState extends ConverterState {}

class DataCleanedState extends ConverterState {}

class CurrenciesSwitchedState extends ConverterState {}

class ResetState extends ConverterState {}
