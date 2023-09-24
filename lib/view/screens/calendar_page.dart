import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/controller/provider/event_provider.dart';
import 'package:harpoon_events_app/util/ui.dart';
import 'package:harpoon_events_app/view/widgets/custom_container.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../widgets/stroke_text.dart';

final currentDayProvider = StateProvider<DateTime>((ref) => DateTime.now());

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorLib.transparent,
      body: Container(
        padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
        child: Column(
          children: [
            Text(
              'Ready to conquer your calendar? Let\'s plan your next adventure! 🗓️',
              style: Fonts.nunito(color: ColorLib.grey),
            ),
            const SizedBox(height: 20),

            // Calendar container
            CustomContainer(
              fillColor: ColorLib.carton,
              width: UI.width(context, 374),
              height: UI.height(context, 349),
              child: TableCalendar(
                rowHeight: 45,
                availableGestures: AvailableGestures.all,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Fonts.tropiline(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  weekendStyle: Fonts.tropiline(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: ColorLib.black,
                        blurRadius: 0,
                        offset: Offset(2.5, 2.5),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  todayTextStyle: TextStyle(color: Colors.black),
                  defaultTextStyle: TextStyle(fontWeight: FontWeight.w500),
                  weekendTextStyle: TextStyle(fontWeight: FontWeight.w500),
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorLib.yellow,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: Fonts.tropiline(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                focusedDay: ref.watch(currentDayProvider),
                firstDay: DateTime.utc(2022),
                lastDay: DateTime.utc(2030),
                selectedDayPredicate: (day) =>
                    isSameDay(day, ref.watch(currentDayProvider)),
                onDaySelected: (DateTime day, DateTime focusedDay) {
                  ref.read(currentDayProvider.notifier).state = day;
                },
              ),
            ),
            const SizedBox(height: 30),

            // Saved Events
            Expanded(
              child: SingleChildScrollView(
                child: Consumer(
                  builder: (context, ref, child) {
                    final events = ref.watch(allEventsProvider);

                    return events.when(
                      data: (evenList) {
                        return Column(
                          children: evenList.where((element) {
                            return ref
                                .watch(currentDayProvider)
                                .isAfter(DateTime.now());
                          }).map((event) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 15),
                              child: savedEvent(
                                context: context,
                                eventTitle: event.title,
                                eventTime: event.startTime,
                                eventLocation: event.location,
                                locationTime: event.endTime,
                              ),
                            );
                          }).toList(),
                        );
                      },
                      error: (error, stackTrace) => Center(
                        child: Text(
                          error.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      loading: () => const CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//! Saved events Widget
Widget savedEvent(
    {required BuildContext context,
    required String eventTitle,
    String? eventTime,
    required String eventLocation,
    String? locationTime}) {
  return CustomContainer(
    fillColor: ColorLib.lightBlue,
    width: UI.width(context, 364),
    height: UI.height(context, 95),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Event title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: StrokeText(
                text: eventTitle,
                strokeWidth: 1,
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Text(
              eventTime ?? '',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )
          ],
        ),

        // Event Location
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              eventLocation,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ColorLib.grey,
                  fontSize: 17),
            ),
            Text(
              locationTime ?? '',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: ColorLib.grey),
            )
          ],
        ),
      ],
    ),
  );
}
