import 'package:event_app/controller/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../widgets/stroke_text.dart';

class CreateEventPage extends ConsumerWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              ref.read(tabProvider.notifier).state = TabState.timeline,
          icon: SvgPicture.asset('assets/SVGs/back-button.svg'),
        ),
      ),
      backgroundColor: ColorLib.transparent,
      body: Center(
        child: StrokeText(
          text: 'Create Event Page',
          textStyle: Fonts.tropiline(
            color: ColorLib.orange,
            fontSize: 40,
            fontWeight: FontWeight.w800,
            height: 0.02,
            letterSpacing: 0.56,
          ),
          strokeColor: ColorLib.black,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
