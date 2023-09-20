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
        centerTitle: true,
        title: const Text('Create Event'),
        leading: IconButton(
          onPressed: () =>
              ref.read(tabProvider.notifier).state = TabState.timeline,
          icon: SvgPicture.asset('assets/SVGs/back-button.svg'),
        ),
      ),
      backgroundColor: ColorLib.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Event Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tropiline',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 380,
                height: 63,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter text here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Event Description',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tropiline',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 380,
                height: 173,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF5FAFF),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter text here',
                      border: InputBorder.none,
                    ),
                    autocorrect: true,
                    maxLines: 5,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'When would the event start?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tropiline',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  dropdown_cell(),
                  SizedBox(
                    width: 24,
                  ),
                  dropdown_cell()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'When would the event end?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Tropiline',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                  letterSpacing: 0.16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  dropdown_cell(),
                  SizedBox(
                    width: 24,
                  ),
                  dropdown_cell()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 131,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Stack(children: [
                        
                      ]),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Add location',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Tropiline',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class dropdown_cell extends StatelessWidget {
  const dropdown_cell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 178,
        height: 63,
        decoration: ShapeDecoration(
          color: const Color(0xFFF5FAFF),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
