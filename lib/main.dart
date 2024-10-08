import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/home/home_notifier.dart';
import 'package:to_do_app/screens/home/home_screen.dart';
import 'package:to_do_app/theme/theme_manager.dart';

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
          create: (BuildContext context) => HomeNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        theme: ThemeManager().themeData,
        home: const HomeScreen(),
      ),
    );
  }
}
