// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/model/group_model.dart';

import '../../../../controller/provider/event_provider.dart';
import '../../../../controller/provider/group_provider.dart';
import '../../../../model/event_model.dart';
import '../../../../util/color_lib.dart';
import '../../../../util/fonts.dart';
import '../../../../util/ui.dart';
import '../../../widgets/stroke_text.dart';
import '../../group_event_view.dart';

class GroupView extends ConsumerWidget {
  final String title;

  const GroupView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final allGroups = await ref.read(allGroupsProvider.future);
            final group = (allGroups.firstWhere(
              (element) => element.title == title,
            ));

            GroupModel groupD = await ref.read(getSingleGroup(group.id).future);

            List<EventModel> events = [];

            if (groupD.events!.isNotEmpty) {
              for (EventModel model in groupD.events!) {
                events.add(await ref.read(getSingleEvent(model.id).future));
              }

              groupD.events = events;
            }

            ref.read(selectedGroupProvider.notifier).state = groupD;

            Navigator.of(context).pushNamed(GroupEventPage.route);
          },
          child: Container(
            width: UI.width(context, 177),
            height: UI.height(context, 177),
            decoration: ShapeDecoration(
              color: const Color(0xFFEF8F76),
              image: const DecorationImage(
                image: AssetImage("assets/images/techies.png"),
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
        ),
        SizedBox(
          height: UI.height(context, 20),
        ),
        SizedBox(
          width: UI.width(context, 177),
          child: StrokeText(
            text: title,
            softWrap: true,
            textStyle: Fonts.tropiline(
              color: ColorLib.orange,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
            strokeColor: ColorLib.black,
            strokeWidth: 1.5,
          ),
        ),
      ],
    );
  }
}
