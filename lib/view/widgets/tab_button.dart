import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/tab_provider.dart';
import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../../util/ui.dart';
import 'custom_container.dart';

class TabButton extends ConsumerWidget {
  final String assetPath;
  final String name;
  final TabState tabState;
  final double padding;

  const TabButton({
    super.key,
    required this.assetPath,
    required this.name,
    required this.tabState,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(tabProvider);

    return InkWell(
      onTap: () => ref.read(tabProvider.notifier).state = tabState,
      child: CustomContainer(
        fillColor:
            currentTab == tabState ? ColorLib.black : ColorLib.transparent,
        width: UI.width(context, 75),
        height: UI.height(context, 54),
        borderRadius: 8.0,
        useShadow: false,
        borderColor: ColorLib.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: currentTab == tabState ? 4 : 0, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: padding),
              child: SvgPicture.asset(
                assetPath,
                colorFilter: ColorFilter.mode(
                  currentTab == tabState ? ColorLib.orange : ColorLib.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              name,
              style: Fonts.nunito(
                color: currentTab == tabState ? ColorLib.orange : ColorLib.grey,
                fontSize: currentTab == tabState ? 12 : 11,
                fontWeight:
                    currentTab == tabState ? FontWeight.w700 : FontWeight.w500,
                height: 0.07,
              ),
            )
          ],
        ),
      ),
    );
  }
}
