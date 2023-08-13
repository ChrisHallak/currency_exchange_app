import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/converter/converter_bloc.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text.dart';

class CurrencyDropDown extends StatefulWidget {
  String? selected;
  List<Currency>? cachedCurrencies;
  TextEditingController controller;
  CurrencyDropDown(
      {required super.key,
      required this.selected,
      required this.cachedCurrencies,
      required this.controller});

  @override
  State<CurrencyDropDown> createState() => CurrencyDropDownState();
}

class CurrencyDropDownState extends State<CurrencyDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 80,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: GREY_50_COLOR,
            border: Border.all(width: 1, color: PRIMARY100_COLOR),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isDense: true,
                    hint: Text("Select Currency"),
                    value: widget.selected,
                    onChanged: (String? value) {
                      BlocProvider.of<ConverterBloc>(context).add(
                          ChooseCurrencyEvent(value: value, key: widget.key));
                    },
                    items: widget.cachedCurrencies!.map((Currency currency) {
                      return DropdownMenuItem<String>(
                        value: currency.code.toString(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: NetworkImage(currency.flag),
                              width: 30,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      currency.code,
                                      style: STYLE5,
                                    ),
                                    Text(currency.currency, style: STYLE6),
                                  ],
                                )),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 100,
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(),
                onEditingComplete: () {
                  BlocProvider.of<ConverterBloc>(context).add(
                      ConvertCurrencyEvent(
                          key: widget.key, input: widget.controller.text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
