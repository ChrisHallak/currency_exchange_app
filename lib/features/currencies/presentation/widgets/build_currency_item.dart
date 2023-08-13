import 'package:flutter/material.dart';

Widget buildCurrencyItem(currency, complete) {
  return Row(
    children: [
      Expanded(
        child: Image.network(
          currency.flag,
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        ),
      ),
      Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(currency.code),
              SizedBox(
                height: 5.0,
              ),
              Text(currency.currency),
            ],
          )),
      complete
          ? Expanded(
              child: Text(currency.buy),
            )
          : SizedBox(),
      complete
          ? Expanded(
              child: Text(currency.sell),
            )
          : SizedBox(),
    ],
  );
}
