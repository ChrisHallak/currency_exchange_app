part of 'converter_bloc.dart';

sealed class ConverterState extends Equatable {
  const ConverterState();

  @override
  List<Object> get props => [];
}

final class ConverterInitial extends ConverterState {}

final class CurrenciesListState extends ConverterState {}
