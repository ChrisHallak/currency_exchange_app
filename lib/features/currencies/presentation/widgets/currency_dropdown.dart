import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_exchange/core/constants.dart';
import 'package:my_exchange/features/currencies/domain/entities/currency.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/converter/converter_bloc.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text.dart';

class CurrencyDropDown extends StatefulWidget {
  final String? selected;
  final List<Currency>? cachedCurrencies;
  final TextEditingController controller;
  final UniqueKey? keyChoose;
  final int chooseOne;

  const CurrencyDropDown({
    this.keyChoose,
    required this.selected,
    required this.cachedCurrencies,
    required this.controller,
    required this.chooseOne,
  }):super(key: keyChoose);

  @override
  State<CurrencyDropDown> createState() => _CurrencyDropDownState();
}

class _CurrencyDropDownState extends State<CurrencyDropDown> {
//   @override
  @override
  Widget build(BuildContext context) {
    print('WIDGET build ${widget.controller.text}');
    return Padding(
      //key: widget.keyChoose,
      key: widget.keyChoose,
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
            Expanded(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isDense: true,
                    hint: Text("Select Currency"),
                    value:widget.selected,
                    onChanged: (String? value) {
                      BlocProvider.of<ConverterBloc>(context).add(
                          ChooseCurrencyEvent(value: value, key: widget.keyChoose));
                    },
                    items: widget.cachedCurrencies!.map((Currency currency) {
                      return DropdownMenuItem<String>(
                        value: currency.code.toString(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            /*Image(
                              image: NetworkImage(currency.flag),
                              width: 30,
                            ),*/
                            CachedNetworkImage(
                              imageUrl: currency.flag,
                              width: 30,
                              placeholder: ((context, url) => Container(
                                    color: Colors.black,
                                  )),
                              errorWidget: (((context, url, error) => Container(
                                    color: Colors.black,
                                    child: Icon(Icons.error),
                                  ))),
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
                textAlign: TextAlign.center,
                controller: widget.controller,
                onEditingComplete: () {
                  print("the key in event${widget.keyChoose}");
                  BlocProvider.of<ConverterBloc>(context).add(
                      ConvertCurrencyEvent(
                          key:widget.keyChoose,
                          chooseOne: widget.chooseOne,
                          input: widget.controller.text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
