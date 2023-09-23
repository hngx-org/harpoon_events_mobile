import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/event_provider.dart';
import '../../model/event_model.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/custom_container.dart';
import '../widgets/stroke_text.dart';
import 'comment_page.dart';

enum FeedType {
  friends,
  everyone,
}

final friendsProvider = StateProvider.autoDispose<FeedType>((ref) => FeedType.friends);

class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsProvider);
    final events = ref.watch(allEventsProvider);

    return Scaffold(
      backgroundColor: ColorLib.transparent,
      body: Padding(
        padding: EdgeInsets.only(left: UI.width(context, 24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Type
            CustomContainer(
              fillColor: ColorLib.transparent,
              height: UI.height(context, 63),
              width: UI.width(context, 380),
              useShadow: false,
              borderRadius: 10,
              borderColor: ColorLib.black,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => ref.read(friendsProvider.notifier).state = FeedType.friends,
                      child: Container(
                        alignment: Alignment.center,
                        height: UI.height(context, 63),
                        width: UI.width(context, 190),
                        decoration: BoxDecoration(
                          color: friends == FeedType.friends ? ColorLib.blueTabColor : ColorLib.lightBlue,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Friends',
                          style: Fonts.tropiline(
                            color: ColorLib.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => ref.read(friendsProvider.notifier).state = FeedType.everyone,
                      child: Container(
                        alignment: Alignment.center,
                        height: UI.height(context, 63),
                        width: UI.width(context, 190),
                        decoration: BoxDecoration(
                          color: friends == FeedType.everyone ? ColorLib.blueTabColor : ColorLib.lightBlue,
                          border: const Border(
                            left: BorderSide(
                              color: ColorLib.black,
                              width: 2,
                            ),
                            right: BorderSide(
                              color: ColorLib.black,
                              width: 0,
                            ),
                            top: BorderSide(
                              color: ColorLib.black,
                              width: 0,
                            ),
                            bottom: BorderSide(
                              color: ColorLib.black,
                              width: 0,
                            ),
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Everyone',
                          style: Fonts.tropiline(
                            color: ColorLib.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Live Events
            CustomContainer(
              alignment: Alignment.center,
              height: UI.height(context, 50),
              width: UI.width(context, 100),
              borderRadius: 12,
              shadowOffset: 2,
              fillColor: const Color.fromARGB(255, 196, 237, 213),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.fiber_manual_record,
                    color: ColorLib.green,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'LIVE',
                    style: Fonts.tropiline(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: UI.height(context, 140),
                child: Row(
                  children: [
                    CustomContainer(
                      height: UI.height(context, 130),
                      width: UI.width(context, 297),
                      fillColor: ColorLib.blue,
                      borderRadius: 8,
                      child: Center(
                        child: SizedBox(
                          width: UI.width(context, 259),
                          height: UI.height(context, 70),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/emoji-with-glasses.png',
                                width: UI.width(context, 84),
                                height: UI.height(context, 75),
                              ),
                              // SizedBox(
                              //   width: UI.width(context, 16),
                              // ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeText(
                                    text: 'Summer Music Fest',
                                    textStyle: Fonts.tropiline(
                                      color: ColorLib.orange,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      height: 0.07,
                                      letterSpacing: 0.16,
                                    ),
                                    strokeColor: ColorLib.black,
                                    strokeWidth: 2,
                                  ),
                                  Text(
                                    'Central Park, Abuja',
                                    style: Fonts.nunito(
                                      color: ColorLib.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 0.07,
                                    ),
                                  ),
                                  Text(
                                    'Friday, 20th May, 2023',
                                    style: Fonts.nunito(
                                      color: ColorLib.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 0.07,
                                    ),
                                  ),
                                  Text(
                                    '16:00-18:00',
                                    style: Fonts.nunito(
                                      color: ColorLib.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 0.07,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const LiveEvent(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Upcoming Events
            CustomContainer(
              alignment: Alignment.center,
              height: UI.height(context, 44),
              width: UI.width(context, 137),
              borderRadius: 12,
              shadowOffset: 2,
              fillColor: const Color.fromARGB(255, 196, 237, 213),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'In 2 Weeks',
                    style: Fonts.tropiline(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: events.when(
                  data: (data) {
                    List<EventModel> eventsList = data.map((e) => e).toList();

                    return Column(
                      children: eventsList
                          .map(
                            (event) => EventView(
                              title: event.title,
                              location: event.location,
                              startDate: event.startDate,
                              endDate: event.endDate,
                              startTime: event.startTime,
                              endTime: event.endTime,
                            ),
                          )
                          .toList(),
                    );
                  },
                  error: (error, stackTrace) => Center(
                    child: Text(
                      error.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveEvent extends StatelessWidget {
  const LiveEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: UI.height(context, 130),
      width: UI.width(context, 297),
      fillColor: ColorLib.blue,
      borderRadius: 8,
      child: Center(
        child: SizedBox(
          width: UI.width(context, 259),
          height: UI.height(context, 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/emoji-with-glasses.png',
                width: UI.width(context, 84),
                height: UI.height(context, 75),
              ),
              // SizedBox(
              //   width: UI.width(context, 16),
              // ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StrokeText(
                    text: 'Summer Music Fest',
                    textStyle: Fonts.tropiline(
                      color: ColorLib.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      height: 0.07,
                      letterSpacing: 0.16,
                    ),
                    strokeColor: ColorLib.black,
                    strokeWidth: 2,
                  ),
                  Text(
                    'Central Park, Abuja',
                    style: Fonts.nunito(
                      color: ColorLib.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                  Text(
                    'Friday, 20th May, 2023',
                    style: Fonts.nunito(
                      color: ColorLib.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                    ),
                  ),
                  Text(
                    '16:00-18:00',
                    style: Fonts.nunito(
                      color: ColorLib.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0.07,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EventView extends ConsumerWidget {
  final String title;
  final String location;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;

  const EventView({
    super.key,
    required this.title,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allEvents = ref.watch(allEventsProvider);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CommentsPage.route);

        allEvents.whenData(
          (data) => ref.read(eventDataProvider.notifier).state =
              data.map((e) => e).toList(),
        );

        ref.read(selectedEventProvider.notifier).state = ref
            .watch(eventDataProvider)
            ?.firstWhere(
              (element) =>
                  (element.title == title) && (element.location == location),
            );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomContainer(
          height: UI.height(context, 130),
          width: UI.width(context, 375),
          fillColor: ColorLib.pink,
          borderRadius: 8,
          child: Padding(
            padding: EdgeInsets.only(left: UI.width(context, 20)),
            child: SizedBox(
              width: UI.width(context, 256),
              height: UI.height(context, 88),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/emoji-with-glasses.png',
                    width: UI.width(context, 84),
                    height: UI.height(context, 75),
                  ),
                  SizedBox(
                    width: UI.width(context, 16),
                  ),
                  SizedBox(
                    height: UI.height(context, 80),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StrokeText(
                          text: title,
                          textStyle: Fonts.tropiline(
                            color: ColorLib.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            height: 0.07,
                            letterSpacing: 0.16,
                          ),
                          strokeColor: ColorLib.black,
                          strokeWidth: 2,
                        ),
                        Text(
                          location,
                          style: Fonts.nunito(
                            color: ColorLib.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 0.07,
                          ),
                        ),
                        Text(
                          startDate,
                          style: Fonts.nunito(
                            color: ColorLib.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0.07,
                          ),
                        ),
                        Text(
                          '$startTime - $endTime',
                          style: Fonts.nunito(
                            color: ColorLib.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0.07,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
