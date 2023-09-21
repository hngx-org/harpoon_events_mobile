import 'package:event_app/controller/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../util/color_lib.dart';
// import '../../util/fonts.dart';
// import '../widgets/stroke_text.dart';

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
              const CustomText(
                text: 'Event Name',
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
               width: double.infinity,
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
                  child: Center(
                    child: TextFormField(
                      maxLines: 2,
                      autocorrect: true,
                      decoration: const InputDecoration(
                        hintText: 'Type Event Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Event Description',
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
               width: double.infinity,
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
                      hintText: 'Type event description',
                      border: InputBorder.none,
                    ),
                    autocorrect: true,
                    maxLines: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'When would the event start?',
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Dropdown_Cell(
                    text: '07 May, 2023',
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Dropdown_Cell(
                    text: '13:00',
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'When would the event end?',
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Dropdown_Cell(
                    text: '07 May, 2023',
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Dropdown_Cell(
                    text: '18:00',
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
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
                      child: const Stack(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20.0,
                            color: Color.fromRGBO(
                                195, 155, 233, 1), // Set the color
                          ),
                        ],
                      ),
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
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 153,
                height: 32,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Stack(
                        children: [
                          Icon(
                            Icons.group,
                            size: 20.0,
                            color: Color.fromRGBO(
                                195, 155, 233, 1), // Set the color
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Select Groups',
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
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 375,
                height: 64,
                padding:
                    const EdgeInsets.symmetric(horizontal: 71, vertical: 18),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFDEEDF7),
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: SizedBox(
                        width: 233,
                        child: Text(
                          'Create Event',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Cabinet Grotesk',
                            fontWeight: FontWeight.w700,
                            height: 0.07,
                            letterSpacing: 0.20,
                          ),
                        ),
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

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Tropiline',
        fontWeight: FontWeight.w600,
        height: 0.09,
        letterSpacing: 0.16,
      ),
    );
  }
}

// ignore: camel_case_types
class Dropdown_Cell extends StatelessWidget {
  final String text; // Add a String parameter for the text content

  const Dropdown_Cell({
    Key? key,
    required this.text, // Require the text parameter
  }) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: cell_text_style(),
              ),
             const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextStyle cell_text_style() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      height: 0.06,
    );
  }
}
