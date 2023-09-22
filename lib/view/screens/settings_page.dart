import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harpoon_events_app/constants.dart';

import '../widgets/custom_container.dart';
import '../widgets/stroke_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<SettingTabsModel> settings = [
      SettingTabsModel(
          name: AppStrings.notification,
          svg: AppImages.notification,
          onTap: () {}),
      SettingTabsModel(
          name: AppStrings.privacy, svg: AppImages.privacy, onTap: () {}),
      SettingTabsModel(
          name: AppStrings.appearance, svg: AppImages.appearance, onTap: () {}),
      SettingTabsModel(
          name: AppStrings.region, svg: AppImages.region, onTap: () {}),
      SettingTabsModel(
          name: AppStrings.settings, svg: AppImages.support, onTap: () {}),
      SettingTabsModel(
          name: AppStrings.about, svg: AppImages.about, onTap: () {}),
      SettingTabsModel(
          name: AppStrings.logOut, svg: AppImages.logOut, onTap: () {}),
    ];

    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Row(
              children: [
                CustomContainer(
                  fillColor: Colors.white,
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      AppStrings.profilePicture,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StrokeText(
                      text: 'Salome',
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("salome357@gmail.com")
                  ],
                )),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  child: const Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: settings.length,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      CustomContainer(
                        fillColor: Colors.white,
                        width: size.width,
                        height: 57,
                        padding: const EdgeInsets.all(0),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: settings[i].onTap,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: SvgPicture.asset(settings[i].svg),
                                  ),
                                  Expanded(
                                      child: Text(
                                    settings[i].name,
                                    style: const TextStyle(
                                      color: Color(0xFF33313E),
                                      fontSize: 18,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                  const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 15,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                }),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}

class SettingTabsModel {
  String svg;
  String name;
  VoidCallback onTap;
  SettingTabsModel(
      {required this.name, required this.svg, required this.onTap});
}
