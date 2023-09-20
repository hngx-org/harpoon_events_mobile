import 'package:flutter_svg/svg.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/app_bg.dart';
import '../widgets/custom_container.dart';
import '../widgets/stroke_text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String route = '/signup';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: UI.height(context, 90),
              left: UI.width(context, 353),
              child: SvgPicture.asset('assets/SVGs/pink-star.svg'),
            ),
            Positioned(
              top: UI.height(context, 115),
              right: UI.width(context, 70),
              child: Image.asset('assets/images/rainbow-image.png'),
            ),
            Positioned(
              top: UI.height(context, 350),
              right: UI.width(context, 30),
              child: Image.asset('assets/images/yellow_n.png'),
            ),
            Positioned(
              top: UI.height(context, 150),
              left: UI.width(context, 60),
              child: Image.asset('assets/images/timeline-image.png'),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Image.asset('assets/images/smiley-emoji.png'),
            ),
            const Positioned(
              bottom: 0,
              child: BottomCard(),
            ),
          ],
        ),
      ),
    );
  }
}

//!  Sign up bottom card
class BottomCard extends StatelessWidget {
  const BottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      height: UI.height(context, 399),
      width: UI.width(context, 428),
      color: ColorLib.purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Headline
          StrokeText(
            text: 'Embrace the Eventful Life',
            textStyle: Fonts.tropiline(
              color: const Color(0xFFF8D3A2),
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
            strokeColor: ColorLib.black,
            strokeWidth: 6,
          ),
          const SizedBox(height: 25),

          // SubheadLine
          StrokeText(
            text:
                'Discover, Create, and Share Memorable Moments with a Thriving Community of \nEvent Lovers.',
            textStyle: Fonts.nunito(
                color: Colors.black12,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.1),
          ),
          const SizedBox(height: 30),

          // Continue with twitter button
          GestureDetector(
            onTap: () {},
            child: CustomContainer(
              fillColor: ColorLib.lightBlue,
              width: UI.width(context, 375),
              height: UI.height(context, 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/SVGs/twitter.svg'),
                  const SizedBox(width: 10),
                  StrokeText(
                    text: 'Continue with Twitter',
                    textStyle: Fonts.cabinetGrotesk(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Continue with Google button
          GestureDetector(
            onTap: () {},
            child: CustomContainer(
              fillColor: ColorLib.lightBlue,
              width: UI.width(context, 375),
              height: UI.height(context, 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/SVGs/google.svg'),
                  const SizedBox(width: 10),
                  StrokeText(
                    text: 'Continue with Google',
                    textStyle: Fonts.cabinetGrotesk(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
