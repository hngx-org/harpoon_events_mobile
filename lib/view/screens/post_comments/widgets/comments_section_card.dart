import 'package:flutter/material.dart';

import '../../../../util/ui.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/stroke_text.dart';
import '../../../../util/color_lib.dart';
import '../../../../util/fonts.dart';

class CommentsSectionContainer extends StatelessWidget {
  const CommentsSectionContainer({
    super.key,
    required this.commenterAvatarURL,
    required this.commenterUsername,
    required this.commentPost,
  });
  final String commenterAvatarURL;
  final String commenterUsername;
  final String commentPost;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //User Avatar
        Image.asset(
          //'assets/images/avatar_post_comments.png',
          commenterAvatarURL,
          width: UI.width(context, 40),
          height: UI.height(context, 40),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomContainer(
              fillColor: ColorLib.white,
              width: UI.width(context, 250),
              height: UI.height(context, 73),
              shadowOffset: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User name
                    StrokeText(
                      text: //'Johnnex',
                          commenterUsername,
                      // strokeColor: ColorLib.black,
                      strokeWidth: 2,
                      textColor: ColorLib.black,
                      textStyle: Fonts.tropiline(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: ColorLib.yellow,
                      ),
                    ),
                    SizedBox(
                      height: UI.height(context, 8),
                    ),
                    // User's post
                    Text(
                      // 'I will be there, no matter what.',
                      commentPost,
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
        ),
      ],
    );
  }
}
