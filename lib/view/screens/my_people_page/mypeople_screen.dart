import 'package:flutter/material.dart';
import 'package:mypeoplescreen/widgets/event_card.dart';
import 'package:mypeoplescreen/widgets/event_card_stack.dart';

class MyPeople extends StatefulWidget {
  const MyPeople({super.key});

  @override
  State<MyPeople> createState() => _MyPeopleState();
}

class _MyPeopleState extends State<MyPeople> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xFFF5FAFF),
            forceMaterialTransparency: true,
            title: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'My People',
                style: TextStyle(
                  color: Color(0xFF493767),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 0.07,
                  letterSpacing: 0.24,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(color: Color(0xFFF5FAFF)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      const Opacity(
                        opacity: 0.50,
                        child: Text(
                          'Keep track of events your connections are attending or hosting.',
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.black,
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
                  )))),
    );
  }
}
