import 'package:flutter/material.dart';

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
            image: const DecorationImage(
              image: AssetImage("assets/177x177.png"),
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
        const Text(
          'YBNL Mafia🎶',
          style: TextStyle(
            color: Color(0xFFFFE824),
            fontSize: 16,
            fontFamily: 'Tropiline',
            fontWeight: FontWeight.w800,
            height: 0.07,
            letterSpacing: 0.16,
          ),
        )
      ],
    );
  }
}
