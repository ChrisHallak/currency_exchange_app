import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_exchange/core/errors/failures.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/domain/usecases/get_all_currencies_usecase.dart';
import 'package:my_exchange/features/currencies/domain/usecases/get_cached_currencies.dart';
import 'package:my_exchange/features/currencies/domain/usecases/get_filtered_currencies_usecase.dart';
import 'package:my_exchange/features/currencies/presentation/pages/coverter_page.dart';
import 'package:my_exchange/features/currencies/presentation/pages/currencies_pages.dart';
import 'package:my_exchange/features/currencies/presentation/pages/gold_page.dart';
import 'package:my_exchange/features/currencies/presentation/pages/settings_page.dart';

import '../../../../../core/errors/strings.dart';

part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  List<Widget> pages = [
    CurrencyPage(),
    ConverterPage(),
    GoldPage(),
    SettingsPage()
  ];
  final GetAllCurrenciesUsecase getAllCurrenciesUsecase;
  final GetFilteredCurrenciesUsecase getFilteredCurrenciesUsecase;
  final GetCachedCurrenciesUsecase getCachedCurrenciesUsecase;

  CurrenciesBloc({
    required this.getAllCurrenciesUsecase,
    required this.getFilteredCurrenciesUsecase,
    required this.getCachedCurrenciesUsecase,
  }) : super(CurrenciesInitial()) {
    on<CurrenciesEvent>((event, emit) async {
      if (event is GetAllCurrenciesEvent) {
        emit(LoadingState());

        var res = await getAllCurrenciesUsecase.call();
        res.fold((failure) {
          emit(GetAllCurrenciesErrorState(
              message: _mapFailureToMessage(failure)));
        }, (allCurrencies) {
          emit(GetAllCurrenciesLoadedState(allCurrencies: allCurrencies));
        });
      } else if (event is GetFilteredCurrenciesEvent) {
        emit(LoadingState());

        var filterdCurrencies =
            await getFilteredCurrenciesUsecase.call(event.search);
        emit(GetFilteredCurrenciesLoadedState(
            filteredCurrencies: filterdCurrencies));
      }
    });
  }

  String _mapFailureToMessage(failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Not expected error, please try again later';
    }
  }
}
