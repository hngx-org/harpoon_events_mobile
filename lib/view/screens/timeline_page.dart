import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/tab_provider.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import '../widgets/custom_container.dart';
import '../widgets/stroke_text.dart';

class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(tabProvider);
    return Scaffold(
      backgroundColor: ColorLib.transparent,
      body: Stack(
        children: [
          Center(
            child: StrokeText(
              text: 'Timeline Page',
              textStyle: Fonts.tropiline(
                color: ColorLib.orange,
                fontSize: 56,
                fontWeight: FontWeight.w800,
                height: 0.02,
                letterSpacing: 0.56,
              ),
              strokeColor: ColorLib.black,
              strokeWidth: 6,
            ),
          ),
          // Floating Action Button
          Positioned(
            top: UI.height(context, 741),
            left: UI.width(context, 344),
            child: currentTab != TabState.createEvent
                ? CustomContainer(
              fillColor: ColorLib.green,
              width: UI.width(context, 56),
              height: UI.height(context, 56),
              child: InkWell(
                onTap: () => ref.read(tabProvider.notifier).state =
                    TabState.createEvent,
                child: const Icon(
                  Icons.add,
                  size: 24,
                  color: ColorLib.white,
                ),
              ),
            )
                : const SizedBox(),
          ),
        ],
      ),

    );
  }
}
