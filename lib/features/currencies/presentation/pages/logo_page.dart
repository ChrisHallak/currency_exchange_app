import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_exchange/core/styles/colors.dart';
import 'package:my_exchange/features/currencies/presentation/pages/home_page.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [PRIMARY_COLOR, SECONDARY_COLOR])),
        child: Scaffold(
          backgroundColor: PRIMARY_COLOR,
          body: Center(
            child: Image.asset('assets/images/logo.png'),
          ),
        ));
  }
}
