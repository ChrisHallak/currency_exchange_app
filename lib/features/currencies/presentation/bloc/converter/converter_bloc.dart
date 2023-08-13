import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/currency.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  List<Currency>? currenciesList;
  ConverterBloc() : super(ConverterInitial()) {
    on<ConverterEvent>((event, emit) {
      if (event is SetCurrenciesListEvent) {
        currenciesList = event.currenciesList;
        emit(CurrenciesListState());
      }
    });
  }
}
