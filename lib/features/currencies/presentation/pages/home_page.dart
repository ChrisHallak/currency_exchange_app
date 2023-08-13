import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_exchange/core/styles/colors.dart';
import 'package:my_exchange/features/currencies/presentation/pages/coverter_page.dart';
import 'package:my_exchange/features/currencies/presentation/pages/currencies_pages.dart';
import 'package:my_exchange/features/currencies/presentation/pages/gold_page.dart';
import 'package:my_exchange/features/currencies/presentation/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> pages = [
  CurrencyPage(),
  ConverterPage(),
  GoldPage(),
  SettingsPage()
];

class _HomePageState extends State<HomePage> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[curIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: curIndex,
        onTap: (value) {
          setState(() {
            curIndex = value;
          });
        },
        height: 50,
        backgroundColor: Colors.white,
        color: PRIMARY500_COLOR,
        animationDuration: Duration(milliseconds: 300), // Corrected duration
        items: [
          SvgPicture.asset(
            'assets/images/currency.svg',
            width: 40,
            height: 40,
          ),
          SvgPicture.asset(
            'assets/images/group.svg',
            width: 30,
            height: 30,
          ),
          SvgPicture.asset(
            'assets/images/gold.svg',
            width: 30,
            height: 30,
          ),
          SvgPicture.asset(
            'assets/images/settings.svg',
            width: 30,
            height: 30,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff623B85),
        onPressed: () {},
        child: Icon(
          Icons.call,
          color: Colors.white,
        ),
      ),
    );
  }
}
