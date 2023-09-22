import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/tab_provider.dart';

class GoBackButton extends ConsumerWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => ref.read(tabProvider.notifier).state = TabState.timeline,
      icon: SvgPicture.asset('assets/SVGs/back-button.svg'),
    );
  }
}
