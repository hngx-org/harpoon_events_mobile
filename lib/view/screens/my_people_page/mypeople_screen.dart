import 'package:event_app/util/color_lib.dart';
import 'package:event_app/util/fonts.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: ColorLib.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ColorLib.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'My People',
            style: Fonts.tropiline(
              color: ColorLib.grey,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            const Opacity(
              opacity: 0.50,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Keep track of events your connections are attending or hosting.',
                  softWrap: true,
                  style: TextStyle(color: Colors.black, fontSize: 17),
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
