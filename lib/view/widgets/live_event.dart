import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/provider/event_provider.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../screens/comment_page.dart';
import 'custom_container.dart';
import 'stroke_text.dart';

class LiveEvent extends ConsumerWidget {
  final String title;
  final String location;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  const LiveEvent({
    super.key,
    required this.title,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).pushNamed(CommentsPage.route);

        final allEvents = await ref.read(allEventsProvider.future);

        ref.read(selectedEventProvider.notifier).state = allEvents.firstWhere(
          (element) =>
              (element.title == title) && (element.location == location),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: UI.width(context, 30)),
        child: CustomContainer(
          height: UI.height(context, 130),
          width: UI.width(context, 297),
          fillColor: ColorLib.blue,
          borderRadius: 8,
          child: Center(
            child: SizedBox(
              width: UI.width(context, 259),
              height: UI.height(context, 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/emoji-with-glasses.png',
                    width: UI.width(context, 84),
                    height: UI.height(context, 75),
                  ),
                  // SizedBox(
                  //   width: UI.width(context, 16),
                  // ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StrokeText(
                        text: title,
                        textStyle: Fonts.tropiline(
                          color: ColorLib.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          height: 0.07,
                          letterSpacing: 0.16,
                        ),
                        strokeColor: ColorLib.black,
                        strokeWidth: 2,
                      ),
                      Text(
                        location,
                        style: Fonts.nunito(
                          color: ColorLib.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0.07,
                        ),
                      ),
                      Text(
                        startDate,
                        style: Fonts.nunito(
                          color: ColorLib.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                        ),
                      ),
                      Text(
                        '$startTime - $endTime',
                        style: Fonts.nunito(
                          color: ColorLib.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
