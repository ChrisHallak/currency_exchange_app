import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/currency.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  List<Currency> currenciesList = [];
  ConverterBloc() : super(ConverterInitial()) {
    on<ConverterEvent>((event, emit) {
      if (event is SetCurrenciesListEvent) {
        for (int i = 0; i < 10; i++) {
          if (event.currenciesList[i].code == 'THB') {
            event.currenciesList[i].flag =
                'https://mychangeab.se//flags//THB.png';
          }
          currenciesList.add(event.currenciesList[i]);
        }

        emit(CurrenciesListState());
      }
    });
  }
}
