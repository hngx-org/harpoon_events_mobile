// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_events_app/controller/provider/group_provider.dart';
import 'package:mobile_events_app/view/screens/group_event_view.dart';

import '../../../../util/color_lib.dart';
import '../../../../util/fonts.dart';
import '../../../../util/ui.dart';
import '../../../widgets/stroke_text.dart';

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

            ref.read(selectedGroupProvider.notifier).state =
                allGroups.firstWhere((element) => (element.title == title));

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
