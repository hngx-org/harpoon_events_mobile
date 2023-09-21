
import 'package:event_app/view/widgets/custom_container.dart';
import 'package:event_app/view/widgets/stroke_text.dart';
import 'package:flutter/material.dart';

import '../../../../util/color_lib.dart';
import '../../../../util/fonts.dart';


class TechiesScreen extends StatelessWidget {
  const TechiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Techies💻',
              style: Fonts.tropiline(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: ColorLib.black,
                  letterSpacing: 0.7),
            ),
            Text(
              '12 members',
              style: Fonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorLib.black),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/icons/techiesprofile.png',
              width: 60,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 13, right: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                fillColor: ColorLib.blue,
                width: 200,
                height: 30,
                child: Center(
                  child: Text(
                    'Today, 20th May, 2023',
                    style: Fonts.nunito(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: ColorLib.black,
                        letterSpacing: 0.2),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Inkwell(
                fillColor: ColorLib.pink,
                eventName: 'Football Game',
                address: 'Teslim Balogun Stadium',
                date: 'Friday, 16:00-18:00',
                onTap: () {},
                customWidget: [
                  const SizedBox(
                    width: 14,
                  ),
                  const AlignWidget(
                    widthFactor: 0.5,
                    name: 'assets/images/commentpic.png',
                  ),
                  const AlignWidget(
                    widthFactor: 0.5,
                    name: 'assets/images/commentpic2.png',
                  ),
                  const AlignWidget(
                    widthFactor: 0.5,
                    name: 'assets/images/commentpic3.png',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '11 comments',
                    style: Fonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorLib.black,
                        letterSpacing: 0.2),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Inkwell(
                fillColor: ColorLib.yellow,
                eventName: 'Summer Music Fest',
                address: 'Central Park Abuja',
                date: 'Friday, 16:00-18:00',
                customWidget: [
                  Image.asset(
                    'assets/icons/quotes.png',
                    width: 35,
                  ),
                  Text(
                    'Leave a Comment',
                    style: Fonts.nunito(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: ColorLib.black,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 40,
                  ),
                ],
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

// classes for techies screen

class Inkwell extends StatelessWidget {
  final List<Widget> customWidget;
  final Function onTap;
  final String eventName;
  final String address;
  final String date;
  final Color fillColor;
  const Inkwell({
    super.key,
    required this.customWidget,
    required this.onTap,
    required this.eventName,
    required this.address,
    required this.date,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CustomContainer(
        fillColor: fillColor,
        width: double.infinity,
        height: 230,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 3, right: 13),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/emoji.png',
                            width: 45,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          StrokeText(
                            text: eventName,
                            textStyle: Fonts.tropiline(
                              color: ColorLib.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.56,
                            ),
                            strokeColor: ColorLib.black,
                            strokeWidth: 6,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/location.png',
                            width: 35,
                          ),
                          Text(
                            address,
                            style: Fonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: ColorLib.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomContainer(
                    fillColor: Colors.white,
                    width: 100,
                    height: 50,
                    child: Center(
                      child: Text(
                        'I will join',
                        style: Fonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: ColorLib.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/clock.png',
                    width: 35,
                  ),
                  Text(
                    date,
                    style: Fonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorLib.black,
                        letterSpacing: 0.2),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: ColorLib.black,
                thickness: 0,
              ),
              Row(children: customWidget)
            ],
          ),
        ),
      ),
    );
  }
}

class AlignWidget extends StatelessWidget {
  const AlignWidget({
    super.key,
    required this.widthFactor,
    required this.name,
  });

  final double widthFactor;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: widthFactor,
      child: Image.asset(
        name,
        width: 50,
      ),
    );
  }
}
