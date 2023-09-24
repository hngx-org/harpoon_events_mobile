// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/util/ui.dart';
import 'package:harpoon_events_app/view/widgets/custom_container.dart';
import 'package:harpoon_events_app/view/widgets/stroke_text.dart';
import 'package:intl/intl.dart';

import '../../controller/provider/event_provider.dart';
import '../../controller/provider/group_provider.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import 'comment_page.dart';

class GroupEventPage extends ConsumerWidget {
  static String route = '/group_events';

  const GroupEventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGroup = ref.watch(selectedGroupProvider);
    // Future<EventModel> getTrueEvent(event) async =>
    // await ref.read(getSingleEvent(event.id).future);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              selectedGroup!.title,
              style: Fonts.tropiline(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: ColorLib.black,
                letterSpacing: 0.7,
              ),
            ),
            Text(
              selectedGroup.events!.length > 1
                  ? "${selectedGroup.events!.length} Events"
                  : selectedGroup.events!.length == 1
                      ? "1 Event"
                      : "No Event",
              style: Fonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorLib.black,
              ),
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
      // CustomContainer(
      //   fillColor: ColorLib.blue,
      //   width: 200,
      //   height: 30,
      //   child: Center(
      //     child: Text(
      //       'Today, 20th May, 2023',
      //       style: Fonts.nunito(
      //           fontWeight: FontWeight.w600,
      //           fontSize: 16,
      //           color: ColorLib.black,
      //           letterSpacing: 0.2),
      //     ),
      //   ),
      // ),
      // const SizedBox(
      //   height: 25,
      // ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 20, left: 13, right: 13),
        child: selectedGroup.events!.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "No Event in ${selectedGroup.title}\nPlease select another group :)",
                      textAlign: TextAlign.center,
                      style: Fonts.tropiline(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: selectedGroup.events!
                        .map(
                          (e) => EventInGroup(
                            onTap: () async {
                              Navigator.of(context)
                                  .pushNamed(CommentsPage.route);

                              final allEvents =
                                  await ref.read(allEventsProvider.future);

                              ref.read(selectedEventProvider.notifier).state =
                                  allEvents.firstWhere(
                                (element) =>
                                    (element.title == e.title) &&
                                    (element.location == e.location),
                              );
                              Navigator.of(context)
                                  .pushNamed(CommentsPage.route);
                            },
                            eventName: e.title ?? "",
                            address: e.location ?? "",
                            startDate: e.startDate.toString(),
                            startTime: e.startTime.toString(),
                            endTime: e.endTime.toString(),
                            comments: e.comments.length,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
      ),
    );
  }
}

// classes for techies screen

class EventInGroup extends StatelessWidget {
  final VoidCallback onTap;
  final String eventName;
  final String address;
  final String startDate;
  final String startTime;
  final String endTime;
  final int comments;

  const EventInGroup({
    super.key,
    required this.onTap,
    required this.eventName,
    required this.address,
    required this.startDate,
    required this.startTime,
    required this.endTime,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: CustomContainer(
          fillColor: ColorLib.yellow,
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
                              text:
                                  "${eventName[0].toUpperCase()}${eventName.substring(1)}",
                              textStyle: Fonts.tropiline(
                                color: ColorLib.yellow,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.56,
                              ),
                              strokeColor: ColorLib.black,
                              strokeWidth: 2,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: UI.width(context, 5),
                            ),
                            Image.asset(
                              'assets/icons/location.png',
                              width: 40,
                            ),
                            SizedBox(
                              width: UI.width(context, 7),
                            ),
                            Text(
                              "${address[0].toUpperCase()}${address.substring(1)}",
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
                    SizedBox(
                      width: UI.width(context, 5),
                    ),
                    Image.asset(
                      'assets/icons/clock.png',
                      width: 40,
                    ),
                    SizedBox(
                      width: UI.width(context, 5),
                    ),
                    Text(
                      "${DateFormat("yyyy-MM-dd").parse(startDate).day}/${DateFormat("yyyy-MM-dd").parse(startDate).month}, ${DateFormat("hh:mm:ss").parse(startTime).hour}:${DateFormat("hh:mm:ss").parse(startTime).minute} - ${DateFormat("hh:mm:ss").parse(endTime).hour}:${DateFormat("hh:mm:ss").parse(endTime).minute}",
                      style: Fonts.nunito(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ColorLib.black,
                        letterSpacing: 0,
                      ),
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
                Row(children: [
                  SizedBox(
                    width: UI.width(context, 7),
                  ),
                  Image.asset(
                    'assets/icons/quotes.png',
                    width: 40,
                  ),
                  SizedBox(
                    width: UI.width(context, 10),
                  ),
                  Text(
                    comments > 1
                        ? '$comments comments'
                        : comments == 1
                            ? "$comments comment"
                            : "Leave a comment",
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
                ])
              ],
            ),
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
