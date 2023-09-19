import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/tab_provider.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/app_bg.dart';
import '../widgets/custom_container.dart';
import 'calendar_page.dart';
import 'create_event_page.dart';
import 'my_people_page.dart';
import 'settings_page.dart';
import 'timeline_page.dart';

class MainPage extends ConsumerWidget {
  static String route = '/main';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(tabProvider);

    return AppBg(
      child: Stack(
        fit: StackFit.loose,
        children: [
          // Page View
          Positioned(
            top: 0.0,
            bottom: UI.height(context, 120),
            right: 0,
            left: 0,
            child: currentTab == TabState.timeline
                ? const TimelinePage()
                : currentTab == TabState.myPeople
                    ? const MyPeoplePage()
                    : currentTab == TabState.calendar
                        ? const CalendarPage()
                        : currentTab == TabState.settings
                            ? const SettingsPage()
                            : currentTab == TabState.createEvent
                                ? const CreateEventPage()
                                : const SizedBox(),
          ),

          // Floating Action Button
          Positioned(
            top: UI.height(context, 741),
            left: UI.width(context, 344),
            child: currentTab != TabState.createEvent
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

          // Tab Bar
          Positioned(
            top: UI.height(context, 822),
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
          )
        ],
      ),
    );
  }
}

class TabButton extends ConsumerWidget {
  final String assetPath;
  final String name;
  final TabState tabState;
  final double padding;

  const TabButton({
    super.key,
    required this.assetPath,
    required this.name,
    required this.tabState,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(tabProvider);

    return InkWell(
      onTap: () => ref.read(tabProvider.notifier).state = tabState,
      child: CustomContainer(
        fillColor:
            currentTab == tabState ? ColorLib.black : ColorLib.transparent,
        width: UI.width(context, 75),
        height: UI.height(context, 54),
        borderRadius: 8.0,
        useShadow: false,
        borderColor: ColorLib.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: currentTab == tabState ? 4 : 0, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: padding),
              child: SvgPicture.asset(
                assetPath,
                colorFilter: ColorFilter.mode(
                  currentTab == tabState ? ColorLib.orange : ColorLib.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              name,
              style: Fonts.nunito(
                color: currentTab == tabState ? ColorLib.orange : ColorLib.grey,
                fontSize: currentTab == tabState ? 12 : 11,
                fontWeight:
                    currentTab == tabState ? FontWeight.w700 : FontWeight.w500,
                height: 0.07,
              ),
            )
          ],
        ),
      ),
    );
  }
}
