import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_exchange/core/constants.dart';

import '../../../domain/entities/currency.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  List<Currency> currenciesList = [];
  String? choosen_currency1 = "USD";
  String? choosen_currency2 = "AUD";
  String input1 = '';
  String input2 = '';

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
      } else if (event is ChooseCurrencyEvent) {
        print('EVENT ${event.value}');
        if (event.key == firstKey) {
          print('event key  = firstKey');
          choosen_currency1 = event.value;
          emit(CurrencyChoosenState(currency: choosen_currency1));
        } else if (event.key == secondKey) {
          print('event key  = secondKey');
          choosen_currency2 = event.value;
          emit(CurrencyChoosenState(currency: choosen_currency2));
        }
        ;
      } else if (event is ConvertCurrencyEvent) {
        if (event.key == firstKey) {
          if (event.input != '') {
            print('event.key = first key');

            double firstCurrencyValue = double.parse(event.input);
            double secondCurrenyValue = firstCurrencyValue * 2;
            input1 = event.input;
            input2 = secondCurrenyValue.toString();
          } else {
            input2 = '';
            input1 = '';
          }
          emit(CurrencyConvertedState());
        } else if (event.key == secondKey) {
          print('event.key = secondKey');
          if (event.input != '') {
            double secondCurrencyValue = double.parse(event.input);
            double firstCurrenyValue = secondCurrencyValue / 2.0;
            input2 = event.input;
            input1 = firstCurrenyValue.toString();
          } else {
            input1 = '';
            input2 = '';
          }
          emit(CurrencyConvertedState());
        } else if (event is ClearEvent) {
          print('clear event');
          input1 = '';
          input2 = '';
          emit(DataCleanedState());
        }
      }
    });
  }
}
