import 'package:flutter/material.dart';
import 'package:to_do_app/api/api_files/auth_api.dart';
import 'package:to_do_app/screens/home/home_screen.dart';

class AuthNotifier with ChangeNotifier {
  bool isLogin = true;
  bool showPassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  updateAuthType() {
    isLogin = !isLogin;
    notifyListeners();
  }

  updateShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future authenticate(BuildContext context) async {
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter email!!',
          ),
        ),
      );
      return;
    }

    if (passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter password!!',
          ),
        ),
      );
      return;
    } else if (passwordController.text.trim().length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password must be 5 characters long!',
          ),
        ),
      );
      return;
    }

    await authenticationAPI(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      isLogin: isLogin,
    ).then((value) {
      if (value) {
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        }
      }
    });
  }
}
