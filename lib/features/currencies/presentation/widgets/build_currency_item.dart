import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildCurrencyItem(currency, complete) {
  return Row(
    children: [
      Expanded(
        /*  child: Image.network(
          currency.flag,
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        ),
      */
        child: CachedNetworkImage(
          imageUrl: currency.flag,
          height: 30,
          width: 30,
          fit: BoxFit.contain,
          placeholder: ((context, url) => Container(
                color: Colors.black,
              )),
          errorWidget: (((context, url, error) => Container(
                color: Colors.black,
                child: Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ))),
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
