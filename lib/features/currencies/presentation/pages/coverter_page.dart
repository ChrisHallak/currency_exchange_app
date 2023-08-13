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

import '../../../../core/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConverterBloc, ConverterState>(
      listener: (context, state) {},
      builder: (context, state) {
        print('converter page builder $state');
        firstKey = Key('FIRST KEY');
        secondKey = Key('SECOND KEY');
        TextEditingController controller1 = TextEditingController();
        TextEditingController controller2 = TextEditingController();
        ConverterBloc converterBloc = BlocProvider.of<ConverterBloc>(context);
        controller1.text = converterBloc.input1;
        controller2.text = converterBloc.input2;
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
                controller: controller1,
                key: firstKey,
                selected: converterBloc.choosen_currency1,
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
              key: secondKey,
              selected: converterBloc.choosen_currency2,
              cachedCurrencies: converterBloc.currenciesList,
              controller: controller2,
            ),
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
                          onPressed: () {
                            BlocProvider.of<ConverterBloc>(context)
                                .add(ClearEvent());
                          },
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
