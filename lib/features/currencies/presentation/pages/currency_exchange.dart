import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_exchange/core/styles/colors.dart';
import 'package:my_exchange/core/util.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/converter/converter_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/currencies/currencies_bloc.dart';

import '../widgets/build_currency_item.dart';

class CurrencyExchangePage extends StatefulWidget {
  const CurrencyExchangePage({super.key});

  @override
  State<CurrencyExchangePage> createState() => _CurrencyExchangePageState();
}

class _CurrencyExchangePageState extends State<CurrencyExchangePage> {
  @override
  void initState() {
    print('init state in currencies exchange page');
    BlocProvider.of<CurrenciesBloc>(context).add(GetAllCurrenciesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrenciesBloc, CurrenciesState>(
      listener: (context, state) {
        if (state is GetAllCurrenciesErrorState) {
          showErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        print('currencies bloc builder $state');
        if (state is LoadingState) {
          return Container(
              height: 300,
              child: Center(
                  child: CircularProgressIndicator(
                color: PRIMARY500_COLOR,
              )));
        } else if (state is GetAllCurrenciesLoadedState) {
          BlocProvider.of<ConverterBloc>(context)
              .add(SetCurrenciesListEvent(currenciesList: state.allCurrencies));
          return buildCurrenciesList(state.allCurrencies);
        } else if (state is GetFilteredCurrenciesLoadedState) {
          return buildCurrenciesList(state.filteredCurrencies);
        }
        return SizedBox();
      },
    );
  }

  Widget buildCurrenciesList(allCurrencies) {
    print('BUILD CURRENCIES LIST');
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return buildCurrencyItem(allCurrencies[index], true);
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Container(
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              );
            },
            itemCount: min(allCurrencies.length, 7)),
      ),
    );
  }
}
