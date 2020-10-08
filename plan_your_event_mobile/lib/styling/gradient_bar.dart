import 'package:flutter/cupertino.dart';

import 'colors.dart';

Widget get getGradientBar => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
          appColors['gradinet_dark_color'],
          appColors['gradinet_bright_color'],
        ])));
