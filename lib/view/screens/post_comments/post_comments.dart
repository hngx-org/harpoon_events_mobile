import 'package:flutter/material.dart';

import '../../../util/color_lib.dart';
import '../../../util/fonts.dart';
import '../../../util/ui.dart';
import '../../../view/widgets/custom_container.dart';
import 'widgets/event_detail_card_widgets.dart';
import 'widgets/comments_section_card.dart';

class PostComments extends StatelessWidget {
  static String route = 'post_comments';
  const PostComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorLib.darkBlue,
            ),
          ),
          centerTitle: true,
          // Event Title
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
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
          ),
          actions: [
            // Avatar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/avatar_post_comments.png',
                ),
              ),
            ),
          ]),
      backgroundColor: ColorLib.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
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
                    width: UI.width(context, 200),
                    height: UI.height(context, 28),
                    borderRadius: 12,
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
                  const EventDetaileCard(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // Comments and posts
              const SizedBox(
                child: Column(
                  children: [
                    CommentsSectionContainer(
                      commenterAvatarURL:
                          'assets/images/avatar_post_comments.png',
                      commenterUsername: 'Johnnex',
                      commentPost: 'I will be there, no matter what.',
                    ),
                    CommentsSectionContainer(
                      commenterAvatarURL:
                          'assets/images/avatar_post_comments.png',
                      commenterUsername: 'Jannex',
                      commentPost: ' no matter what.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
