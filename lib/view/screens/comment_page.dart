import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_events_app/controller/provider/event_provider.dart';
import 'package:mobile_events_app/controller/services/event_services.dart';
import 'package:mobile_events_app/util/color_lib.dart';
import 'package:mobile_events_app/util/fonts.dart';
import 'package:mobile_events_app/util/ui.dart';
import 'package:mobile_events_app/view/widgets/custom_container.dart';
import 'package:mobile_events_app/view/widgets/snack_bar.dart';
import 'package:mobile_events_app/view/widgets/stroke_text.dart';

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
                      // Text(
                      //   "12 members",
                      //   style: Fonts.nunito(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 16,
                      //     color: const Color(0xFF000000).withOpacity(0.5),
                      //   ),
                      // ),
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
                      selectedEvent.startDate.toString(),
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
                                  StrokeText(
                                    text: selectedEvent.title,
                                    textStyle: const TextStyle(
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
              const SizedBox(height: 10),
              // ref.watch(getComments(selectedEvent.id!)).when(
              //       data: (data) {
              //         return data.isEmpty
              //             ? Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     "You havent made any comment on this Event",
              //                     style: Fonts.nunito(
              //                         fontWeight: FontWeight.w700,
              //                         fontSize: 14,
              //                         color: ColorLib.black),
              //                   ),
              //                 ],
              //               )
              //             : Expanded(
              //                 child: ListView.builder(
              //                     shrinkWrap: true,
              //                     itemCount: data.length,
              //                     itemBuilder: (context, index) {
              //                       final item = data[index];
              //                       return Padding(
              //                         padding:
              //                             const EdgeInsets.only(bottom: 20),
              //                         child: Row(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             const CustomCircleAvatar(
              //                                 radius: 20,
              //                                 imageLocation:
              //                                     'assets/images/comment_image.png'),
              //                             const SizedBox(width: 10),
              //                             Container(
              //                               decoration: BoxDecoration(
              //                                   borderRadius:
              //                                       BorderRadius.circular(8),
              //                                   border: Border.all(
              //                                       color: ColorLib.black,
              //                                       width: 2)),
              //                               width: UI.width(context, 338),
              //                               child: Padding(
              //                                 padding:
              //                                     const EdgeInsets.all(10.0),
              //                                 child: Column(
              //                                   crossAxisAlignment:
              //                                       CrossAxisAlignment.start,
              //                                   children: [
              //                                     const StrokeText(
              //                                       text: "User",
              //                                       textStyle: TextStyle(
              //                                           fontSize: 16,
              //                                           fontWeight:
              //                                               FontWeight.w800),
              //                                     ),
              //                                     const SizedBox(
              //                                       height: 10,
              //                                     ),
              //                                     Text(
              //                                       item.body ?? "",
              //                                       style: Fonts.nunito(
              //                                           fontWeight:
              //                                               FontWeight.w600,
              //                                           fontSize: 14,
              //                                           color: ColorLib.black),
              //                                     ),
              //                                     // if (image != null) ...[
              //                                     //   const SizedBox(
              //                                     //     height: 10,
              //                                     //   ),
              //                                     //   Container(
              //                                     //     constraints: const BoxConstraints.expand(
              //                                     //       width: 308,
              //                                     //       height: 180,
              //                                     //     ),
              //                                     //     decoration: BoxDecoration(
              //                                     //       border: Border.all(color: ColorLib.black, width: 2),
              //                                     //       image: DecorationImage(
              //                                     //         image: AssetImage("'assets/images/comment_image.png'"),
              //                                     //         fit: BoxFit.cover,
              //                                     //       ),
              //                                     //       borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              //                                     //     ),
              //                                     //   )
              //                                     // ]
              //                                   ],
              //                                 ),
              //                               ),
              //                             )
              //                           ],
              //                         ),
              //                       );
              //                     }),
              //               );
              //       },
              //       error: (error, stackTrace) => Center(
              //         child: Text(
              //           error.toString(),
              //           style: Theme.of(context).textTheme.bodyLarge,
              //         ),
              //       ),
              //       loading: () => const Center(
              //         child: CircularProgressIndicator(),
              //       ),
              //     ),
              //The comments section/view
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

final sendLoading = StateProvider<bool>((ref) => false);

//Custom bottom navigation bar
class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends ConsumerState<CustomBottomNavigationBar> {
  final _messageController = TextEditingController();
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvent = ref.watch(selectedEventProvider);
    ref.listen(createCommentResponse, (previous, next) {
      if (next!.status == "success") {
        _messageController.clear();
        ref.read(sendLoading.notifier).state = false;
        // ignore: unused_result
        // ref.refresh(getComments(selectedEvent!.id!));
      } else {
        ref.read(sendLoading.notifier).state = false;
        snackBarBottom(
          content: next.errMessage ?? "",
          context: context,
          backgroundColor: Colors.red,
        );
      }
    });
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
          child: TextField(
            maxLines: null,
            controller: _messageController,
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: "Type a message"),
          ),
        ),
        GestureDetector(
            onTap: () {
              if (_messageController.text.isNotEmpty) {
                final datas = {
                  "eventid": selectedEvent!.id,
                  "body": _messageController.text.trim(),
                };
                ref.read(sendLoading.notifier).state = true;
                // ref.read(createComment(datas));
              }
            },
            child: ref.watch(sendLoading)
                ? const CircularProgressIndicator()
                : const Icon(Icons.send))
      ]),
    );
  }
}
