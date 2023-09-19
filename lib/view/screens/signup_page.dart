import 'package:flutter/material.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/app_bg.dart';
import '../widgets/custom_container.dart';
import '../widgets/stroke_text.dart';

class SignUpPage extends StatelessWidget {
  static String route = '/signup';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StrokeText(
                text: 'SignUp Page',
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
              const SizedBox(
                height: 50,
              ),

              // An example of the container that's used throughout the app.
              // You can customize to match the bcakground of any widget in the app.
              CustomContainer(
                fillColor: ColorLib.purple,
                width: UI.width(context, 375),
                height: UI.height(context, 130),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
