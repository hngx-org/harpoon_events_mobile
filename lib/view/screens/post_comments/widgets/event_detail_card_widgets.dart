import 'package:flutter/material.dart';

import '../../../../util/ui.dart';
import '../../../widgets/custom_container.dart';
import '../../../widgets/stroke_text.dart';
import '../../../../util/color_lib.dart';
import '../../../../util/fonts.dart';

class EventDetaileCard extends StatelessWidget {
  const EventDetaileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      fillColor: ColorLib.blue,
      width: double.infinity,
      height: UI.height(context, 230),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: UI.height(context, 10),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SizedBox(
                          width: UI.width(context, 10),
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

                    SizedBox(
                      height: UI.height(context, 4),
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

                        SizedBox(
                          height: UI.height(context, 8),
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
                  fillColor: ColorLib.lighterBlue,
                  width: UI.width(context, 109),
                  height: UI.height(context, 44),
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
                Expanded(
                  child: Text(
                    'Check box to send invite to techies',
                    style: Fonts.nunito(
                      fontSize: 14,
                      color: ColorLib.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Back icon button
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorLib.darkBlue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
