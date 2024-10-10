import 'package:flutter/material.dart';
import 'package:to_do_app/components/button_text.dart';
import 'package:to_do_app/components/custom_button.dart';
import 'package:to_do_app/constant/app_constant.dart';
import 'package:to_do_app/constant/path_constant.dart';
import 'package:to_do_app/screens/auth/login_screen.dart';
import 'package:to_do_app/utils/get_size.dart';
import 'package:to_do_app/utils/spacing_extension.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showOnboarding = false;

  @override
  void initState() {
    Future.wait([AppConstant().getUserData()]).whenComplete(() {
      if (AppConstant.uid.isEmpty) {
        if (mounted) {
          setState(() {
            showOnboarding = true;
          });
        }
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            );
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                PathConstant.splash,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              Visibility(
                visible: showOnboarding,
                child: Column(
                  children: [
                    SizedBox(
                      width: getWidth(context) * 0.7,
                      child: const Text(
                        "Task Management & To-Do List",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    (20.0).height,
                    SizedBox(
                      width: getWidth(context) * 0.8,
                      child: const Text(
                        "This productive tool is designed to help "
                        "you better manage your task "
                        "project-wise conveniently!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    (20.0).height,
                    CustomButton(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false,
                        );
                      },
                      widget: Row(
                        children: [
                          const Spacer(),
                          buttonText(text: "Let's Start"),
                          const Spacer(),
                          Image.asset(
                            PathConstant.arrowRight,
                            height: 28,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    (getHeight(context) * 0.1).height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
