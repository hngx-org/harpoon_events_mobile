import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harpoon_events_app/util/color_lib.dart';
import 'package:harpoon_events_app/util/fonts.dart';
import 'package:harpoon_events_app/util/ui.dart';
import 'package:harpoon_events_app/view/widgets/custom_container.dart';
import 'package:harpoon_events_app/view/widgets/stroke_text.dart';

import '../../controller/event_provider.dart';
import '../widgets/app_bg.dart';

class CommentsPage extends ConsumerWidget {
  static String route = '/comment';

  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEvent = ref.watch(selectedEventProvider);

    return AppBg(
      child: Scaffold(
        backgroundColor: ColorLib.white,
        //Added the CustomNavigationBar
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Padding(
          padding:
              EdgeInsets.only(top: UI.height(context, 49), left: 12, right: 12),
          //Column for the layout of the entire screen
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Row for the layout of the Techies, backbutton and user profile circle avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset('assets/SVGs/back-button.svg')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        selectedEvent!.title,
                        style: Fonts.tropiline(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          letterSpacing: 0.01,
                          color: ColorLib.deepPurple,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "12 members",
                        style: Fonts.nunito(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xFF000000).withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const CustomCircleAvatar(
                    radius: 22,
                    imageLocation: "assets/images/profile-picture.png",
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //Customcontainer to for the event details
              CustomContainer(
                fillColor: ColorLib.lightBlue,
                width: 177,
                height: 27,
                borderRadius: 20,
                shadowOffset: 2.0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Center(
                    child: Text(
                      selectedEvent.startDate,
                      style: Fonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: ColorLib.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              //Userprofile, Circular
              CustomContainer(
                fillColor: ColorLib.blue,
                width: 375,
                height: 198,
                borderRadius: 12,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/smiley-face.png",
                                    height: 32,
                                    width: 32,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const StrokeText(
                                    text: "Football Game",
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/SVGs/location-icon.svg"),
                                  const SizedBox(width: 4),
                                  Text(
                                    selectedEvent.location,
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
                          //Customcontainer for the share button
                          CustomContainer(
                            fillColor: ColorLib.lightBlue,
                            width: UI.width(context, 109),
                            height: UI.width(context, 44),
                            borderRadius: 8,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Center(
                                child: Text(
                                  "Share",
                                  style: Fonts.cabinetGrotesk(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: ColorLib.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/SVGs/clock-icon.svg"),
                          const SizedBox(width: 4),
                          Text(
                            "${selectedEvent.startTime} - ${selectedEvent.endTime}",
                            style: Fonts.nunito(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorLib.black),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/SVGs/check-box.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Check box to send invite to techie",
                                style: Fonts.nunito(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: ColorLib.black),
                              )
                            ],
                          ),
                          RotatedBox(
                            quarterTurns: 2,
                            child:
                                SvgPicture.asset('assets/SVGs/back-button.svg'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              //The comments section/view
              Expanded(
                child: ListView(
                  children: const [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCircleAvatar(
                            radius: 20,
                            imageLocation: 'assets/images/comment_image.png'),
                        SizedBox(width: 10),
                        CommentContainer(
                          userName: "Johnnex",
                          comment: "I will be there, no matter what",
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCircleAvatar(
                            radius: 20,
                            imageLocation: 'assets/images/comment_image.png'),
                        SizedBox(width: 10),
                        CommentContainer(
                            userName: "Johnnex",
                            comment: "I defo won't miss this",
                            image: "assets/images/running-image.png")
                      ],
                    )
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

//Custom container for the comments section
class CommentContainer extends StatelessWidget {
  const CommentContainer(
      {this.image, required this.userName, required this.comment, super.key});
  final String? image;
  final String userName;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorLib.black, width: 2)),
      width: UI.width(context, 338),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StrokeText(
              text: userName,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              comment,
              style: Fonts.nunito(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: ColorLib.black),
            ),
            if (image != null) ...[
              const SizedBox(
                height: 10,
              ),
              Container(
                constraints: const BoxConstraints.expand(
                  width: 308,
                  height: 180,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorLib.black, width: 2),
                  image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

//CustomCircleAvatar for user profile and each user comment picture
class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {required this.radius, required this.imageLocation, super.key});
  final double radius;
  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: radius - 5,
        backgroundImage: AssetImage(imageLocation),
      ),
    );
  }
}

//Custom bottom navigation bar
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: UI.width(context, 428),
      height: UI.height(context, 115),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorLib.black, width: 2)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SvgPicture.asset('assets/SVGs/image-icon.svg'),
        Container(
          color: ColorLib.lighterBlue,
          width: 300,
          height: 52,
          child: const TextField(
            maxLines: null,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                hintText: "Type a message"),
          ),
        ),
        const Icon(Icons.mic_none)
      ]),
    );
  }
}
