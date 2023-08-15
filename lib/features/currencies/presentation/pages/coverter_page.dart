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
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  // GlobalKey firstWidgetKey = GlobalKey();
  // GlobalKey secondWidgetKey = GlobalKey();
  @override
  void initState() {
    BlocProvider.of<ConverterBloc>(context).add(ConverterResetEvent());
    print('init state in converter page');
  }

  int chooseOne1 = 1;
  int chooseOne2 = 2;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConverterBloc, ConverterState>(
      listener: (context, state) {
        if (state is CurrenciesSwitchedState) {
          print('FIRST KEY IN LISTENER ');
        }
        if (state is CurrencyConvertedState) {
          if (state.oneChoosed == 1) {
            print("in first");
            ConverterBloc converterBloc =
                BlocProvider.of<ConverterBloc>(context);
            controller1.text = converterBloc.input1;
            controller2.text = converterBloc.input2;
          } else {
            print("in second");
            ConverterBloc converterBloc =
                BlocProvider.of<ConverterBloc>(context);
            controller2.text = converterBloc.input1;
            controller1.text = converterBloc.input2;
          }
        } else {
          print("in third");
          ConverterBloc converterBloc = BlocProvider.of<ConverterBloc>(context);

          if (firstKey != converterBloc.firstKeybloc) {
            print('first condition switch');
            controller1.text = converterBloc.input1;
            controller2.text = converterBloc.input2;
          } else {
            print('second condition switch');
            controller1.text = converterBloc.input2;
            controller2.text = converterBloc.input1;
          }
        }
      },
      builder: (context, state) {
        print("first and second${firstKey}${secondKey}");

        ConverterBloc converterBloc = BlocProvider.of<ConverterBloc>(context);

        print(
            'converter page builder ${converterBloc.input1}${converterBloc.input2}${controller1}${controller2}');

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
                chooseOne: chooseOne1,
                controller: controller1,
                keyChoose: firstKey!,
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
                      color: BlocProvider.of<ConverterBloc>(context).switchIndex
                          ? PRIMARY_STROKE_COLOR
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: PRIMARY_STROKE_COLOR,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.swap_vert_sharp,
                        color:
                            BlocProvider.of<ConverterBloc>(context).switchIndex
                                ? Colors.white
                                : PRIMARY_STROKE_COLOR,
                      ),
                      onPressed: () {
                        //  setState(() {
                        UniqueKey tempKey = firstKey!;
                        firstKey = secondKey;
                        secondKey = tempKey;
                        //  TextEditingController tempController = controller1;
                        //  controller1=controller2;
                        // controller2=tempController;
                        int chooseTemp = 0;
                        chooseTemp = chooseOne1;
                        chooseOne1 = chooseOne2;
                        chooseOne2 = chooseTemp;
                        //     });
                        bool curIndex =
                            BlocProvider.of<ConverterBloc>(context).switchIndex;

                        setState(() {
                          BlocProvider.of<ConverterBloc>(context)
                              .add(SwitchEvent(switchIndex: !curIndex));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            CurrencyDropDown(
              chooseOne: chooseOne1,
              keyChoose: secondKey!,
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
