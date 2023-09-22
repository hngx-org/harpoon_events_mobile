// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../constants.dart';
import '../../controller/services/auth_services.dart';
import '../../controller/tab_provider.dart';
import '../../model/user_model.dart';
import '../../services/twitter_login_services.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/app_bg.dart';
import '../widgets/custom_container.dart';
import '../widgets/snack_bar.dart';
import '../widgets/stroke_text.dart';
import 'main_page.dart';

final twitterLoading = StateProvider.autoDispose<bool>((ref) => false);

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
              right: UI.width(context, 25),
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
class BottomCard extends ConsumerWidget {
  const BottomCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginResponseProvider, (previous, next) {
      if (next!.status == "success") {
        ref.read(twitterLoading.notifier).state = false;
        snackBar(
          content: "Success",
          context: context,
          backgroundColor: ColorLib.green,
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(MainPage.route);
      } else {
        ref.read(twitterLoading.notifier).state = false;
        snackBar(
          content: next.errMessage ?? "",
          context: context,
          backgroundColor: Colors.red,
        );
      }
    });
    return Container(
      padding: const EdgeInsets.only(
        right: 25,
        left: 25,
        top: 35,
      ),
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
              fontSize: 28,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
            strokeColor: ColorLib.black,
            strokeWidth: 1.7,
          ),
          const SizedBox(height: 25),

          // SubheadLine
          Text(
            'Discover, Create, and Share Memorable Moments with a Thriving Community of Event Lovers.',
            style: Fonts.nunito(
                color: Colors.black54,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3),
          ),
          const SizedBox(height: 20),

          // Continue with twitter button
          Consumer(builder: (context, ref, child) {
            final loadingState = ref.watch(twitterLoading);

            ref.listen(loginTwitterResponse, (previous, next) async {
              if (next!.status == TwitterLoginStatus.loggedIn) {
                final result = next;
                snackBar(
                  content: "Logging in as ${next.user!.name}, Please wait...",
                  context: context,
                  backgroundColor: ColorLib.green,
                );

                log("In twitter responses");
                String name = result.user!.name;
                log(result.user!.id.toString());
                log(result.user!.email.toString());

                // Use their unique ID as their email as not all user have email
                String email = '${result.user!.id}@gmail.com';
                String avatar = result.user!.thumbnailImage;
                String source = 'twitter';
                final data = LoginDataModel(name: name, email: email, avatar: avatar, source: source);
                ref.read(loginProvider(data));

              } else if (next.status == TwitterLoginStatus.cancelledByUser) {
                ref.read(twitterLoading.notifier).state = false;
                snackBar(
                  content: "Cancelled",
                  context: context,
                  backgroundColor: ColorLib.purple,
                );
              } else {
                ref.read(twitterLoading.notifier).state = false;
                snackBar(
                  content: next.errorMessage,
                  context: context,
                  backgroundColor: Colors.red,
                );
              }
            });

            return GestureDetector(
              onTap: loadingState
                  ? () {}
                  : () async {
                      ref.read(twitterLoading.notifier).state = true;
                      ref.read(getData);
                    },
              child: CustomContainer(
                fillColor: ColorLib.lightBlue,
                width: UI.width(context, 375),
                height: UI.height(context, 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/SVGs/twitter.svg'),
                    const SizedBox(width: 10),
                    Text(
                      loadingState ? 'Loading...' : 'Continue with Twitter',
                      style: Fonts.cabinetGrotesk(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 20),

          // Continue with Google button
          GestureDetector(
            onTap: () async {
              // GoogleAuth().signInWithGoogle();
              String name = "Farouk Bello";
              String email = 'faroukbello@gmail.com';
              String source = 'google';

              final data = LoginDataModel(
                name: name,
                email: email,
                avatar: null,
                source: source,
              );
              ref.read(loginProvider(data));

              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacementNamed(MainPage.route);
            },
            child: CustomContainer(
              fillColor: ColorLib.lightBlue,
              width: UI.width(context, 375),
              height: UI.height(context, 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/SVGs/google.svg'),
                  const SizedBox(width: 10),
                  Text(
                    'Continue with Google',
                    style: Fonts.cabinetGrotesk(
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
