import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../util/color_lib.dart';
import '../../../util/fonts.dart';
import '../../../util/ui.dart';
import '../../../view/widgets/custom_container.dart';
import 'widgets/event_detail_card_widgets.dart';
import 'widgets/comments_section_card.dart';

class PostComments extends ConsumerStatefulWidget {
  static String route = 'post_comments';
  const PostComments({super.key});

  @override
  ConsumerState<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends ConsumerState<PostComments> {
  final messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

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
                  style: Fonts.tropiline(fontWeight: FontWeight.w700, fontSize: 24.0, color: ColorLib.darkBlue),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/images/avatar_post_comments.png',
                ),
              ),
            ),
          ]),
      backgroundColor: ColorLib.white,
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: ColorLib.white,
        color: ColorLib.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.image_outlined),
              onPressed: () {},
            ),
            Expanded(
              child: CustomContainer(
                fillColor: ColorLib.lighterBlue,
                width: double.infinity,
                height: 60,
                child: TextField(
                  controller: messageController,
               
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                log("hbjh");
              },
              icon: const Icon(
                Icons.send,
                color: ColorLib.black,
              ),
            )
          ],
        ),
      ),
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
                    fillColor: ColorLib.lighterBlue,
                    width: UI.width(context, 200),
                    height: UI.height(context, 28),
                    borderRadius: 12,
                    shadowOffset: 1,
                    borderWidth: 1.0,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Today, ',
                            style: Fonts.nunito(fontSize: 13, fontWeight: FontWeight.w700, color: ColorLib.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '20th May, ',
                                style: Fonts.nunito(fontSize: 13, fontWeight: FontWeight.w700, color: ColorLib.black),
                              ),
                              TextSpan(
                                text: '2023',
                                style: Fonts.nunito(fontSize: 13, fontWeight: FontWeight.w700, color: ColorLib.black),
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
                      commenterAvatarURL: 'assets/images/avatar_post_comments.png',
                      commenterUsername: 'Johnnex',
                      commentPost: 'I will be there, no matter what.',
                    ),
                    CommentsSectionContainer(
                      commenterAvatarURL: 'assets/images/avatar_post_comments.png',
                      commenterUsername: 'Jannex  Doe',
                      commentPost: ' no matter what.',
                    ),
                    CommentsSectionContainer(
                      commenterAvatarURL: 'assets/images/avatar_post_comments.png',
                      commenterUsername: 'Jannex  Doe',
                      commentPost: ' no matter what.',
                    ),
                    CommentsSectionContainer(
                      commenterAvatarURL: 'assets/images/avatar_post_comments.png',
                      commenterUsername: 'Jannex  Doe',
                      commentPost: ' no matter what.',
                    ),
                    CommentsSectionContainer(
                      commenterAvatarURL: 'assets/images/avatar_post_comments.png',
                      commenterUsername: 'Jannex  Doe',
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
