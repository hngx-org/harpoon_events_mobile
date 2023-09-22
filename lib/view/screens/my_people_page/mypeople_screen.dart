import 'package:flutter/material.dart';
import 'package:harpoon_events_app/util/color_lib.dart';
import 'package:harpoon_events_app/util/fonts.dart';

import 'widgets/event_card.dart';
import 'widgets/event_card_stack.dart';

class MyPeople extends StatefulWidget {
  const MyPeople({super.key});

  @override
  State<MyPeople> createState() => _MyPeopleState();
}

class _MyPeopleState extends State<MyPeople> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Opacity(
              opacity: 0.50,
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Text(
                  'Keep track of events your connections are attending or hosting.',
                  softWrap: true,
                  style: Fonts.nunito(
                    color: ColorLib.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(width: size.width * 0.05),
                EventCard(size: size),
                SizedBox(width: size.width * 0.05),
                EventCardStack(size: size)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
