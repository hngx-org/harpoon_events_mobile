import 'package:flutter/material.dart';
import 'package:harpoon_events_app/util/color_lib.dart';
import 'package:harpoon_events_app/util/fonts.dart';
import 'package:harpoon_events_app/view/widgets/stroke_text.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 177,
          height: 177,
          decoration: ShapeDecoration(
            color: const Color(0xFFF6CC9D),
            image: const DecorationImage(
              image: AssetImage("assets/images/ybnl_mafia.png"),
              fit: BoxFit.none,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFF000000),
                blurRadius: 0,
                offset: Offset(4, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        SizedBox(height: size.height * 0.025),
        StrokeText(
          text: 'YBNL Mafia 🎶',
          textStyle: Fonts.tropiline(
            color: ColorLib.orange,
            // fontSize: 48,
            fontWeight: FontWeight.w800,
            // height: 0.02,
            // letterSpacing: 0.56,
          ),
          strokeColor: ColorLib.black,
          strokeWidth: 3,
        ),
      ],
    );
  }
}
