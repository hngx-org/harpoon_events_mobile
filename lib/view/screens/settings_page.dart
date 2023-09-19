import 'package:flutter/material.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../widgets/stroke_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.transparent,
      body: Center(
        child: StrokeText(
          text: 'Settings Page',
          textStyle: Fonts.tropiline(
            color: ColorLib.orange,
            fontSize: 56,
            fontWeight: FontWeight.w800,
            height: 0.02,
            letterSpacing: 0.56,
          ),
          strokeColor: ColorLib.black,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
