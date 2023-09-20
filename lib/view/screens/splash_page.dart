import 'dart:async';

import 'package:event_app/view/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/app_bg.dart';
import '../widgets/stroke_text.dart';
// import 'main_page.dart'

class SplashPage extends StatefulWidget {
  static String route = '/';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Force the app to be displayed in full screen
  hideUIOverlay() =>
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  // Exit Full Screen
  showUIOverlay() => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);

  // Timer to move away from the splash page
  Future<Timer> initialize() async => Timer(
        const Duration(seconds: 3),
        // Change this to 'SignupPage.route'
        () => Navigator.of(context).pushReplacementNamed(SignUpPage.route),
      );

  @override
  void initState() {
    // Go fullscreen upon launching the app
    hideUIOverlay();
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    // Exit full screen after leaving the splash page
    showUIOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: UI.height(context, 96),
              left: UI.width(context, 353),
              child: SvgPicture.asset('assets/SVGs/pink-star.svg'),
            ),
            Positioned(
              top: UI.height(context, 266),
              left: 0,
              right: 0,
              child: Image.asset('assets/images/onboard.png'),
            ),
            Positioned(
              top: UI.height(context, 272),
              left: UI.width(context, 102),
              child: SvgPicture.asset('assets/SVGs/yellow-star.svg'),
            ),
            Positioned(
              top: UI.height(context, 537),
              left: UI.width(context, 330),
              child: SvgPicture.asset('assets/SVGs/blue-star.svg'),
            ),
            Positioned(
              top: UI.height(context, 626),
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: StrokeText(
                  text: 'WetinDeySup',
                  textStyle: Fonts.tropiline(
                    color: const Color(0xFFF8D3A2),
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    height: 0.02,
                    letterSpacing: 0.56,
                  ),
                  strokeColor: ColorLib.black,
                  strokeWidth: 6,
                ),
              ),
            ),
            Positioned(
              top: UI.height(context, 846),
              left: UI.width(context, 54),
              child: SvgPicture.asset('assets/SVGs/lightBrown-star.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
