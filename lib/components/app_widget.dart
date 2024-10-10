import 'package:flutter/material.dart';
import 'package:to_do_app/constant/path_constant.dart';
import 'package:to_do_app/theme/color.dart';

class AppWidget extends StatelessWidget {
  final Widget child;
  const AppWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgColor,
        image: DecorationImage(
          image: AssetImage(
            PathConstant.background,
          ),
        ),
      ),
      child: child,
    );
  }
}
