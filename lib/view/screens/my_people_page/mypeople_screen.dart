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
            child: SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Keep track of events your connections are attending or hosting.',
                          softWrap: true,
                          style: Fonts.nunito(
                            color: Colors.black,
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
                ))));
  }
}
