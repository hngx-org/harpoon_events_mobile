import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harpoon_events_app/controller/services/auth_services.dart';
import 'package:harpoon_events_app/util/color_lib.dart';
import 'package:harpoon_events_app/view/screens/signup_page.dart';
import 'package:harpoon_events_app/view/widgets/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../widgets/custom_container.dart';
import '../widgets/stroke_text.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final userData = ref.watch(getUserDataProvider);
    List<SettingTabsModel> settings = [
      SettingTabsModel(name: AppStrings.notification, svg: AppImages.notification, onTap: () {}),
      SettingTabsModel(name: AppStrings.privacy, svg: AppImages.privacy, onTap: () {}),
      SettingTabsModel(name: AppStrings.appearance, svg: AppImages.appearance, onTap: () {}),
      SettingTabsModel(name: AppStrings.region, svg: AppImages.region, onTap: () {}),
      SettingTabsModel(name: AppStrings.settings, svg: AppImages.support, onTap: () {}),
      SettingTabsModel(name: AppStrings.about, svg: AppImages.about, onTap: () {}),
      SettingTabsModel(
          name: AppStrings.logOut,
          svg: AppImages.logOut,
          onTap: () async {
            await ref.watch(clearCredentialsProvider.future).then((value) async {
              if (value) {
                log(value.toString());
                Navigator.of(context).pushNamedAndRemoveUntil(
                  SignUpPage.route,
                  ModalRoute.withName(SignUpPage.route),
                );
              } else {
                snackBar(
                  content: "Unable to sign out please try again...",
                  context: context,
                  backgroundColor: Colors.red,
                );
              }
            });
          }),
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

                      "${userData.isLoading ? "" : userData.value!.user!.avatar}",
                      height: 100,
                      width: 100,
                         frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                        errorBuilder: (context, error, stackTrace) {
                          return const Placeholder();
                        },
                          loadingBuilder: ((context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        color: ColorLib.yellow,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                            
                          }),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StrokeText(
                      text: "${userData.isLoading ? "" : userData.value!.user!.name}",
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("${userData.isLoading ? "" : userData.value!.user!.email}")
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
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
  SettingTabsModel({required this.name, required this.svg, required this.onTap});
}
