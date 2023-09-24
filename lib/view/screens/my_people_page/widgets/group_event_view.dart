import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/controller/event_provider.dart';
import 'package:harpoon_events_app/view/screens/comment_page.dart';
import 'package:harpoon_events_app/view/widgets/custom_container.dart';
import 'package:harpoon_events_app/view/widgets/stroke_text.dart';
import 'package:intl/intl.dart';

import '../../../../controller/group_provider.dart';
import '../../../../controller/services/event_services.dart';
import '../../../../util/color_lib.dart';
import '../../../../util/fonts.dart';

class GroupEventPage extends ConsumerStatefulWidget {
  static String route = '/techies';

  const GroupEventPage({super.key});

  @override
  ConsumerState<GroupEventPage> createState() => _GroupEventPageState();
}

class _GroupEventPageState extends ConsumerState<GroupEventPage> {
  String today = DateFormat.yMMMMd('en_US').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final selectedGroup = ref.watch(selectedGroupProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              selectedGroup!.title,
              style: Fonts.tropiline(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: ColorLib.black,
                letterSpacing: 0.7,
              ),
            ),
            Text(
              ref.watch(getEventProvider(ref.watch(selectedGroupProvider)!.id)).isLoading ||
                      ref.watch(getEventProvider(ref.watch(selectedGroupProvider)!.id)).hasError
                  ? "..."
                  : "${ref.watch(getEventProvider(ref.watch(selectedGroupProvider)!.id)).value!.length} Members",
              style: Fonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: ColorLib.black),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/icons/techiesprofile.png',
              width: 60,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 13, right: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              fillColor: ColorLib.blue,
              width: 200,
              height: 30,
              child: Center(
                child: Text(
                  'Today, $today',
                  textAlign: TextAlign.center,
                  style: Fonts.nunito(fontWeight: FontWeight.w600, fontSize: 16, color: ColorLib.black, letterSpacing: 0.2),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ref.watch(getEventProvider(ref.watch(selectedGroupProvider)!.id)).when(
                  data: (data) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = data[index];
                            final comments = item.comments.length > 1;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Inkwell(
                                fillColor: ColorLib.pink,
                                eventName: item.title ?? "",
                                address: item.location ?? "",
                                date: "${item.startTime} - ${item.endTime}",
                                onTap: () {
                                  ref.read(selectedEventProvider.notifier).state = item;
                                  Navigator.pushNamed(context, CommentsPage.route);
                                },
                                customWidget: [
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  const AlignWidget(
                                    widthFactor: 0.5,
                                    name: 'assets/images/commentpic.png',
                                  ),
                                  const AlignWidget(
                                    widthFactor: 0.5,
                                    name: 'assets/images/commentpic2.png',
                                  ),
                                  const AlignWidget(
                                    widthFactor: 0.5,
                                    name: 'assets/images/commentpic3.png',
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    comments ? "${item.comments.length} Comments" : "${item.comments.length} Comment",
                                    style: Fonts.nunito(fontWeight: FontWeight.w700, fontSize: 16, color: ColorLib.black, letterSpacing: 0.2),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    size: 40,
                                  ),
                                ],
                              ),
                            );
                          }),
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

// classes for techies screen

class Inkwell extends StatelessWidget {
  final List<Widget> customWidget;
  final VoidCallback onTap;
  final String eventName;
  final String address;
  final String date;
  final Color fillColor;
  const Inkwell({
    super.key,
    required this.customWidget,
    required this.onTap,
    required this.eventName,
    required this.address,
    required this.date,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        fillColor: fillColor,
        width: double.infinity,
        height: 230,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 3, right: 13),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/emoji.png',
                            width: 45,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          StrokeText(
                            text: eventName,
                            textStyle: Fonts.tropiline(
                              color: ColorLib.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.56,
                            ),
                            strokeColor: ColorLib.black,
                            strokeWidth: 2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/location.png',
                            width: 35,
                          ),
                          Text(
                            address,
                            style: Fonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: ColorLib.black,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomContainer(
                    fillColor: Colors.white,
                    width: 100,
                    height: 50,
                    child: Center(
                      child: Text(
                        'I will join',
                        style: Fonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: ColorLib.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/clock.png',
                    width: 35,
                  ),
                  Text(
                    date,
                    style: Fonts.nunito(fontWeight: FontWeight.w700, fontSize: 16, color: ColorLib.black, letterSpacing: 0.2),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: ColorLib.black,
                thickness: 0,
              ),
              Row(children: customWidget)
            ],
          ),
        ),
      ),
    );
  }
}

class AlignWidget extends StatelessWidget {
  const AlignWidget({
    super.key,
    required this.widthFactor,
    required this.name,
  });

  final double widthFactor;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: widthFactor,
      child: Image.asset(
        name,
        width: 50,
      ),
    );
  }
}
