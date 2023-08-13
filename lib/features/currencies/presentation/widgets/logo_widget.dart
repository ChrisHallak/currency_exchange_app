import 'package:flutter/material.dart';
import 'package:my_exchange/core/styles/colors.dart';
import 'package:my_exchange/features/currencies/presentation/pages/MyWave.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyWave(),
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 40,
              child: Image.asset('assets/images/logo.png'),
            ),
            Positioned(
                top: 130,
                left: 40,
                child: Text(
                  'Last update 10/08/2023',
                  style: TextStyle(color: PRIMARY50_COLOR, fontSize: 11),
                )),
          ],
        ),
      ),
    );
  }
}
