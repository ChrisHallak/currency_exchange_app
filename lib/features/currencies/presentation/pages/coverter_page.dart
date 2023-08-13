/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_exchange/core/styles/colors.dart';
import 'package:my_exchange/core/styles/text.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/currencies/currencies_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/pages/currency_exchange.dart';
import 'package:my_exchange/features/currencies/presentation/widgets/build_currency_item.dart';
import 'package:my_exchange/features/currencies/presentation/widgets/logo_widget.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  @override
  Widget build(BuildContext context) {
    const double kDefaultPadding = 20.0;
    var searchController = TextEditingController();

    return Column(
      children: [
        LogoWidget(),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Buy'),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            color: Colors.grey[300],
            child: DropdownButton<Currency>(
              onChanged: (value) {},
              items: [
                DropdownMenuItem(
                    value: Currency(
                        currency: 'Euro',
                        code: 'EUR',
                        flag: 'https:\\mychangeab.se\flags\EUR.png'),
                    child: buildCurrencyItem(
                        Currency(
                            currency: 'Euro',
                            code: 'EUR',
                            flag: 'https:\\mychangeab.se\flags\EUR.png'),
                        false)),
                DropdownMenuItem(
                    value: Currency(
                        currency: 'Euro',
                        code: 'EUR',
                        flag: 'https:\\mychangeab.se\flags\EUR.png'),
                    child: buildCurrencyItem(
                        Currency(
                            currency: 'Euro',
                            code: 'EUR',
                            flag: 'https:\\mychangeab.se\flags\EUR.png'),
                        false)),
                DropdownMenuItem(
                    value: Currency(
                        currency: 'SYR',
                        code: 'EUR',
                        flag: 'https:\\mychangeab.se\flags\EUR.png'),
                    child: buildCurrencyItem(
                        Currency(
                            currency: 'SYR',
                            code: 'EUR',
                            flag: 'https:\\mychangeab.se\flags\EUR.png'),
                        false)),
                DropdownMenuItem(
                    value: Currency(
                        currency: 'AUS',
                        code: 'EUR',
                        flag: 'https:\\mychangeab.se\flags\EUR.png'),
                    child: buildCurrencyItem(
                        Currency(
                            currency: 'AUS',
                            code: 'EUR',
                            flag: 'https:\\mychangeab.se\flags\EUR.png'),
                        false)),
              ],
              value: Currency(
                  currency: 'SYR',
                  code: 'EUR',
                  flag: 'https:\\mychangeab.se\flags\EUR.png'),
            ),
          ),
        )
      ],
    );
  }
}



*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_exchange/core/styles/colors.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/converter/converter_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/currencies/currencies_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/widgets/currency_dropdown.dart';
import 'package:my_exchange/features/currencies/presentation/widgets/logo_widget.dart';

import '../../../../core/styles/text.dart';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  @override
  void initState() {
    print('init state in converter page');
  }

  List<Currency> currencies = [
    /*Currency(code: 'USD', currency: 'US Dollar', flag: '🇺🇸'),
    Currency(code: 'EUR', currency: 'Euro', flag: '🇪🇺'),
    Currency(code: 'JPY', currency: 'Japanese Yen', flag: '🇯🇵'),*/
    // Add more currencies here...
    Currency(
        code: 'USD',
        currency: 'US Dollar',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'EUR',
        currency: 'Euro',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'JPY',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'SYR',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'LDF',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'EFF',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'EEE ',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'AAA',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'ZZZ',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'FFF',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'GGG',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'HHH',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'TTT',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'WWW',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'QQQ',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
    Currency(
        code: 'PPP',
        currency: 'Japanese Yen',
        flag: 'https://mychangeab.se/flags/EUR.png'),
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey _key1 = GlobalKey();
    GlobalKey _key2 = GlobalKey();
    String? _selected1 = "USD";
    String? _selected2 = "AUD";
    return BlocConsumer<ConverterBloc, ConverterState>(
      listener: (context, state) {},
      builder: (context, state) {
        ConverterBloc converterBloc = BlocProvider.of<ConverterBloc>(context);

        return Column(
          children: <Widget>[
            LogoWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Buy',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            CurrencyDropDown(
                key: _key1,
                selected: _selected1,
                cachedCurrencies: converterBloc.currenciesList),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: PRIMARY_STROKE_COLOR,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.swap_vert_sharp,
                        color: PRIMARY_STROKE_COLOR,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            CurrencyDropDown(
                key: _key2,
                selected: _selected2,
                cachedCurrencies: converterBloc.currenciesList),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: PRIMARY_STROKE_COLOR,
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Clear',
                            style: STYLE6,
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'current foreign currencies exchange',
                    style: STYLE7,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
