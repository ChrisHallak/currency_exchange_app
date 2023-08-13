import 'package:flutter/material.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/presentation/widgets/build_currency_item.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text.dart';

class CurrencyDropDown extends StatefulWidget {
  String? selected;
  List<Currency> cachedCurrencies;
  CurrencyDropDown(
      {required super.key,
      required this.selected,
      required this.cachedCurrencies});

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
            // color: Colors.red,
            color: GREY_50_COLOR,
            border: Border.all(width: 1, color: PRIMARY100_COLOR),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              //color: Colors.black,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isDense: true,
                    hint: Text("Select Currency"),
                    value: widget.selected,
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.selected = newValue;
                      });
                    },
                    items: widget.cachedCurrencies.map((Currency currency) {
                      return DropdownMenuItem<String>(
                        value: currency.code.toString(),
                        // value: _mySelection,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: NetworkImage(currency.flag),
                              width: 30,
                            ),
                            Container(
                                //  color: Colors.amber,
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
                decoration: InputDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
