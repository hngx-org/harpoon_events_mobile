import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile_events_app/controller/services/auth_services.dart';
import 'package:mobile_events_app/view/screens/signup_page.dart';
import 'package:mobile_events_app/view/widgets/snack_bar.dart';

import '../../controller/provider/tab_provider.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/app_bg.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/tab_button.dart';
import 'calendar_page.dart';
import 'create_event_page.dart';
import 'my_people_page/mypeople_screen.dart';
import 'settings_page.dart';
import 'timeline_page.dart';

class MainPage extends ConsumerStatefulWidget {
  static String route = '/main';

  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final currentTab = ref.watch(tabProvider);

    ref.listen(getUserDataProvider, (previous, next) async {
      bool hasExpired = JwtDecoder.isExpired(next.value!.token ?? "");
      if (hasExpired) {
        snackBar(
          content: "User Session terminated. Please, Re-Login",
          context: context,
          backgroundColor: ColorLib.purple,
        );
        await ref.watch(clearCredentialsProvider.future).then((value) async {
          if (value) {
            log(value.toString());
            Navigator.of(context).pushNamedAndRemoveUntil(
              SignUpPage.route,
              ModalRoute.withName(SignUpPage.route),
            );
          } else {
            snackBar(
              content: "Unable to sign out please try again...",
              context: context,
              backgroundColor: Colors.red,
            );
          }
        });
      }
    });

    return MainBg(
      child: Scaffold(
        backgroundColor: ColorLib.transparent,
        appBar: AppBar(
          title: Text(
            currentTab == TabState.timeline
                ? 'Timeline'
                : currentTab == TabState.myPeople
                    ? 'My People'
                    : currentTab == TabState.calendar
                        ? 'Calendar'
                        : currentTab == TabState.settings
                            ? 'Settings'
                            : currentTab == TabState.createEvent
                                ? 'Create Event'
                                : '',
            style: Fonts.tropiline(
              color: ColorLib.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 0.02,
              letterSpacing: 1.6,
            ),
          ),
          leading:
              currentTab == TabState.createEvent ? const GoBackButton() : null,
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorLib.transparent,
          shadowColor: ColorLib.transparent,
          forceMaterialTransparency: true,
        ),
        body: Stack(
          fit: StackFit.loose,
          children: [
            // Page View
            Positioned(
              top: 0.0,
              bottom: UI.height(context, 110),
              right: 0,
              left: 0,
              child: currentTab == TabState.timeline
                  ? const TimelinePage()
                  : currentTab == TabState.myPeople
                      ? const MyPeople()
                      : currentTab == TabState.calendar
                          ? const CalendarPage()
                          : currentTab == TabState.settings
                              ? const SettingsPage()
                              : currentTab == TabState.createEvent
                                  ? const CreateEventPage()
                                  : const SizedBox(),
            ),

            // Tab Bar
            Positioned(
              bottom: UI.height(context, 20),
              left: UI.width(context, 24),
              child: CustomContainer(
                fillColor: ColorLib.purple,
                width: UI.width(context, 376),
                height: UI.height(context, 79),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TabButton(
                      assetPath: 'assets/SVGs/timeline.svg',
                      name: 'Timeline',
                      tabState: TabState.timeline,
                      padding: 4.0,
                    ),
                    TabButton(
                      assetPath: 'assets/SVGs/people.svg',
                      name: 'My People',
                      tabState: TabState.myPeople,
                      padding: 4.0,
                    ),
                    TabButton(
                      assetPath: 'assets/SVGs/calendar.svg',
                      name: 'Calendar',
                      tabState: TabState.calendar,
                    ),
                    TabButton(
                      assetPath: 'assets/SVGs/settings.svg',
                      name: 'Settings',
                      tabState: TabState.settings,
                    )
                  ],
                ),
              ),
            ),

            // Floating Action Button
            Positioned(
              bottom: UI.height(context, 120),
              left: UI.width(context, 345),
              child: currentTab == TabState.timeline
                  ? CustomContainer(
                      fillColor: ColorLib.green,
                      width: UI.width(context, 56),
                      height: UI.height(context, 56),
                      child: InkWell(
                        onTap: () => ref.read(tabProvider.notifier).state =
                            TabState.createEvent,
                        child: const Icon(
                          Icons.add,
                          size: 24,
                          color: ColorLib.white,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
