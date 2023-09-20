import 'package:event_app/view/widgets/stroke_text.dart';
import 'package:flutter/material.dart';

import '../../util/color_lib.dart';
import '../../util/fonts.dart';
import '../widgets/custom_container.dart';

class PostComments extends StatelessWidget {
  static String route = 'post_comments';
  const PostComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorLib.darkBlue,
          ),
          centerTitle: true,
          // Event Title
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Techies💻',
                style: Fonts.tropiline(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                    color: ColorLib.darkBlue),
              ),
              Text(
                '12 members',
                style: Fonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorLib.black,
                ),
              )
            ],
          ),
          actions: [
            // Avatar
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Image.asset(
                'assets/images/avatar_post_comments.png',
              ),
            ),
          ]),
      backgroundColor: ColorLib.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            //  container column with Date and Post
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  fillColor: ColorLib.blueTabColor,
                  width: 150,
                  height: 24,
                  shadowOffset: 1,
                  borderWidth: 1.0,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Today, ',
                          style: Fonts.nunito(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: ColorLib.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '20th May, ',
                              style: Fonts.nunito(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: ColorLib.black),
                            ),
                            TextSpan(
                              text: '2023',
                              style: Fonts.nunito(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: ColorLib.black),
                            ),
                          ]),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                // Event details container
                CustomContainer(
                  fillColor: ColorLib.blue,
                  width: double.infinity,
                  height: 198,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Column with Event Title, location and date
                          Column(
                            children: [
                              //  Event Title
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Icon
                                  Image.asset('assets/icons/emoji_icon.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  StrokeText(
                                    text: 'Football Game',
                                    textStyle: Fonts.tropiline(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: ColorLib.yellow,
                                    ),
                                    strokeColor: ColorLib.black,
                                    strokeWidth: 2.0,
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 4,
                              ),
                              // Event Location

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      //Icon
                                      Image.asset(
                                        'assets/icons/location_icon.png',
                                      ),
                                      // Event Location
                                      Text(
                                        'Teslim Balogun Stadium',
                                        style: Fonts.nunito(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: ColorLib.black,
                                        ),
                                      )
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),
                                  // Event Date and Time
                                  Row(
                                    children: [
                                      //Icon
                                      Image.asset(
                                        'assets/icons/location_icon.png',
                                      ),

                                      // Event Day and Time

                                      Text(
                                        'Friday, 16:00-18:00',
                                        style: Fonts.nunito(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: ColorLib.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Share button
                          CustomContainer(
                            fillColor: ColorLib.blueTabColor,
                            width: 80,
                            height: 44,
                            child: Center(
                              child: Text(
                                'Share',
                                style: Fonts.nunito(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: ColorLib.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        color: ColorLib.grey,
                      ),
                      //Row with check box to send invites
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // checkBox
                          Checkbox(
                            value: false,
                            onChanged: (tick) {},
                          ),

                          //Text: Checkbox to send invite
                          Text(
                            'Check box to send invite to techies',
                            style: Fonts.nunito(
                              fontSize: 14,
                              color: ColorLib.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          // Back icon button
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorLib.darkBlue,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            // Comments and posts
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //User Avatar
                Image.asset(
                  'assets/images/avatar_post_comments.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomContainer(
                    fillColor: ColorLib.white,
                    width: 250,
                    height: 73,
                    shadowOffset: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // User name
                          StrokeText(
                            text: 'Johnnex',
                            // strokeColor: ColorLib.black,
                            strokeWidth: 2,
                            textColor: ColorLib.black,
                            textStyle: Fonts.tropiline(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: ColorLib.yellow,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // User's post
                          Text(
                            'I will be there, no matter what.',
                            style: Fonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorLib.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
