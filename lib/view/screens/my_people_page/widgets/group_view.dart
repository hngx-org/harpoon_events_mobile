import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/controller/provider/group_provider.dart';
import 'package:harpoon_events_app/model/group_model.dart';

import '../../../../util/color_lib.dart';
import '../../../../util/fonts.dart';
import '../../../../util/ui.dart';
import '../../../widgets/stroke_text.dart';
import '../../group_event_view.dart';

final groupsDataProvider = StateProvider<List<GroupModel>?>((ref) => null);

class GroupView extends ConsumerWidget {
  final String title;

  const GroupView({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allGroups = ref.watch(allGroupsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint("jbdikfsdjkbfvsd");
            allGroups.whenData(
              (data) =>
                  ref.read(groupsDataProvider.notifier).state = data.map((e) {
                debugPrint(e.title.toString());
                return e;
              }).toList(),
            );
            ref.read(selectedGroupProvider.notifier).state =
                ref.watch(groupsDataProvider)?.firstWhere((element) {
              return element.title == title;
            });
            debugPrint(ref.watch(selectedGroupProvider)!.title);
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
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 75,
                    height: 27,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFDEEDF7),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0xFF000000),
                          blurRadius: 0,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '2 events',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
