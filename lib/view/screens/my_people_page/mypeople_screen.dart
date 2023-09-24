import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/group_provider.dart';
import '../../../model/group_model.dart';
import '../../../util/color_lib.dart';
import '../../../util/fonts.dart';
import '../../../util/ui.dart';
import 'widgets/group_view.dart';

class MyPeople extends ConsumerWidget {
  const MyPeople({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allGroups = ref.watch(allGroupsProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Opacity(
              opacity: 0.80,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: UI.width(context, 16)),
                child: Text(
                  'Keep track o events your connections are attending or hosting.',
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: Fonts.nunito(
                    color: ColorLib.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: UI.height(context, 10)),
            allGroups.when(
              data: (data) {
                List<GroupModel> groupsList = data.map((e) => e).toList();

                return Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: UI.width(context, 20),
                  runSpacing: UI.width(context, 20),
                  children: groupsList
                      .map(
                        (group) => GroupView(
                          title: group.title,
                        ),
                      )
                      .toList(),
                );
              },
              error: (error, stackTrace) => Center(
                child: Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
