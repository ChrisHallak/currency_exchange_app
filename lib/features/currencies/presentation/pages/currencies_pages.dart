import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_exchange/core/styles/colors.dart';
import 'package:my_exchange/core/styles/text.dart';
import 'package:my_exchange/features/currencies/presentation/bloc/currencies/currencies_bloc.dart';
import 'package:my_exchange/features/currencies/presentation/pages/currency_exchange.dart';
import 'package:my_exchange/features/currencies/presentation/widgets/logo_widget.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    const double kDefaultPadding = 20.0;
    var searchController = TextEditingController();

    return Column(
      children: [
        Stack(
          children: [
            LogoWidget(),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: GREY_50_COLOR,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.black,
                    ),
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: PRIMARY500_COLOR,
                      spreadRadius: -5.0,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search_sharp),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          BlocProvider.of<CurrenciesBloc>(context)
                              .add(GetFilteredCurrenciesEvent(search: value));
                        },
                        decoration: InputDecoration(
                          hintText: "search",
                          hintStyle: STYLE2,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
              'current foreign currencies exchange rates to Sweden kronaincluding currency converter.'),
        ),
        SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            children: [
              Expanded(
                child: Text('Currency'),
                flex: 4,
              ),
              Expanded(
                child: Text('Buy'),
                flex: 1,
              ),
              Expanded(
                child: Text('Sell'),
                flex: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Container(
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        CurrencyExchangePage(),
      ],
    );
  }
}
