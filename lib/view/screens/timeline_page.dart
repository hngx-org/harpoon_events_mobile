import 'dart:ffi';

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
      appBar: AppBar(
        title: StrokeText(
              text: 'Timeline',
              textStyle: Fonts.tropiline(
                color: ColorLib.black,
                fontSize: 20,
                fontWeight: FontWeight.w100,
                height: 0.02,
                letterSpacing: 1.6,
              ),
            ),
        centerTitle: true,
      ),
      backgroundColor: ColorLib.transparent,
      body: Stack(
        children: [
          Positioned(
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  height: UI.height(context, 63),
                  width: UI.width(context, 360),
                  fillColor: Color.fromARGB(255, 117, 156, 235),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                        child: Text('Friends')
                        ),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text('Everyone'),
                        // style: ButtonStyle(
                        //   backgroundColor: 
                        //),
                        )
                    ],
                  ),
                  
                ),
                const SizedBox(
                  height: 27,
                ),
                CustomContainer(
                  height: UI.height(context, 50),
                  width: UI.width(context, 100),
                  fillColor: Color.fromARGB(255, 196, 237, 213),
                  child: Row(
                    children: [
                      Icon(Icons.fiber_manual_record),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Live',
                                style: Fonts.tropiline(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 130,
                  width: 360,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomContainer(
                          height: UI.height(context, 130),
                          width: UI.width(context, 297),
                          fillColor: ColorLib.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              Image.asset('assets/images/emoji-with-glasses.png'),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeText(
                                    text: 'Football match',
                                    textStyle: Fonts.tropiline(
                                      color: ColorLib.orange,
                                    ),
                                    strokeColor: ColorLib.black,
                                    strokeWidth: 2,),
                                  Text('Central Park, Abuja'),
                                  Text('Friday, 20th May, 2023'),
                                  Text('16:00-18:00'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomContainer(
                          height: UI.height(context, 130),
                          width: UI.width(context, 297),
                          fillColor: ColorLib.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              Image.asset('assets/images/smiley-emoji.png', scale: 1.4,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeText(
                                    text: 'Football match',
                                    textStyle: Fonts.tropiline(
                                      color: ColorLib.orange,
                                    ),
                                    strokeColor: ColorLib.black,
                                    strokeWidth: 2,),
                                  Text('Central Park, Abuja'),
                                  Text('Friday, 20th May, 2023'),
                                  Text('16:00-18:00'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomContainer(
                  height: UI.height(context, 55),
                  width: UI.width(context, 170),
                  fillColor: Color.fromARGB(255, 241, 218, 246),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('in two weeks',
                                style: Fonts.tropiline(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )
                                ),
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 220,
                  width: 350,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(
                          height: UI.height(context, 130),
                          width: UI.width(context, 375),
                          fillColor: Color.fromARGB(255, 250, 184, 251),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              Image.asset('assets/images/emoji-with-glasses.png'),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeText(
                                    text: 'Football match',
                                    textStyle: Fonts.tropiline(
                                      color: ColorLib.orange,
                                    ),
                                    strokeColor: ColorLib.black,
                                    strokeWidth: 2,),
                                  Text('Central Park, Abuja'),
                                  Text('Friday, 20th May, 2023'),
                                  Text('16:00-18:00'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomContainer(
                          height: UI.height(context, 130),
                          width: UI.width(context, 375),
                          fillColor: Color.fromARGB(255, 243, 237, 63),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              Image.asset('assets/images/smiley-emoji.png',scale: 1.4,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeText(
                                    text: 'Football match',
                                    textStyle: Fonts.tropiline(
                                      color: ColorLib.orange,
                                    ),
                                    strokeColor: ColorLib.black,
                                    strokeWidth: 2,),
                                  Text('Central Park, Abuja'),
                                  Text('Friday, 20th May, 2023'),
                                  Text('16:00-18:00'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomContainer(
                          height: UI.height(context, 130),
                          width: UI.width(context, 375),
                          fillColor: const Color.fromARGB(255, 184, 236, 251),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              Image.asset('assets/images/emoji-with-glasses.png'),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StrokeText(
                                    text: 'Football match',
                                    textStyle: Fonts.tropiline(
                                      color: ColorLib.orange,
                                    ),
                                    strokeColor: ColorLib.black,
                                    strokeWidth: 2,),
                                  Text('Central Park, Abuja'),
                                  Text('Friday, 20th May, 2023'),
                                  Text('16:00-18:00'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: UI.height(context, 650),
            left: UI.width(context, 345),
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
        ]
      )
    );
  }
}
