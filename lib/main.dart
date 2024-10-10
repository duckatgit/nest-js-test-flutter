import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/auth/auth_notifier.dart';
import 'package:to_do_app/screens/home/home_notifier.dart';
import 'package:to_do_app/screens/splash/splash_screen.dart';
import 'package:to_do_app/theme/theme_manager.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthNotifier(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HomeNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        theme: ThemeManager().themeData,
        scaffoldMessengerKey: snackBarKey,
        // home: const HomeScreen(),
        home: const SplashScreen(),
      ),
    );
  }
}
