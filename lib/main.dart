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
        scaffoldBackgroundColor: const Color.fromRGBO(245, 250, 255, 1),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Color(0xFF493767),
            fontSize: 24,
            fontFamily: 'Tropiline',
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: 0.24,
          ),
          centerTitle: true
        ),
        highlightColor: Color(0xFF493767).withOpacity(0.2),
        splashColor: Color(0xFF493767).withOpacity(0.2),
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
