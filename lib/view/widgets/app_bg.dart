import 'package:flutter/material.dart';

import '../../util/color_lib.dart';

// The background of each page of the app
class AppBg extends StatelessWidget {
  final Widget child;

  const AppBg({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill),
        ),
        child: child,
      ),
    );
  }
}

// The background of each page of the app
class MainBg extends StatelessWidget {
  final Widget child;

  const MainBg({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: ColorLib.bgColor),
        child: child,
      ),
    );
  }
}
