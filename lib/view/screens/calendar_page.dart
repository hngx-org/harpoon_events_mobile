import 'package:flutter/material.dart';
import 'package:harpoon_events_app/util/ui.dart';
import 'package:harpoon_events_app/view/widgets/custom_container.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../widgets/stroke_text.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLib.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Column(
            children: [
              Text(
                'Ready to conquer your calendar? Let\'s plan your next adventure! 🗓️',
                style: Fonts.nunito(color: ColorLib.grey),
              ),
              const SizedBox(height: 20),

              // Calendar container
              const Calendar(),
              const SizedBox(height: 30),

              // Saved Events
              savedEvent(
                context: context,
                eventTitle: 'Movie Night',
                eventTime: '8:30 PM',
                eventLocation: 'Genesis cinemas, Festac',
                locationTime: '9:45 PM',
              )
            ],
          ),
        ),
      ),
    );
  }
}

//! Calendar Widget
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime currentDay = DateTime.now(); // get the current day of the week
  void _onSelected(DateTime day, DateTime focusedDay) {
    setState(() {
      currentDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      fillColor: ColorLib.carton,
      width: UI.width(context, 374),
      height: UI.height(context, 349),
      child: TableCalendar(
        rowHeight: 45,
        availableGestures: AvailableGestures.all,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: Fonts.tropiline(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
          weekendStyle: Fonts.tropiline(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
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
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        focusedDay: currentDay,
        firstDay: DateTime.utc(2022),
        lastDay: DateTime.utc(2030),
        selectedDayPredicate: (day) => isSameDay(day, currentDay),
        onDaySelected: _onSelected,
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
            StrokeText(
              text: eventTitle,
              strokeWidth: 1,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
