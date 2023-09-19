import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view/screens/main_page.dart';
import 'view/screens/signup_page.dart';
import 'view/screens/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNGi - X Task 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      initialRoute: SplashPage.route,
      routes: {
        // Add other pages here.....
        // Be sure to declare the route name as static String variable.
        // For readability sake.
        SplashPage.route: (context) => const SplashPage(),
        SignUpPage.route: (context) => const SignUpPage(),
        MainPage.route: (context) => const MainPage(),
      },
    );
  }
}
