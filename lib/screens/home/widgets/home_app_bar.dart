import 'package:flutter/material.dart';
import 'package:to_do_app/constant/path_constant.dart';
import 'package:to_do_app/screens/home/home_notifier.dart';
import 'package:to_do_app/utils/get_size.dart';
import 'package:to_do_app/utils/spacing_extension.dart';

class HomeAppBar extends StatelessWidget {
  final HomeNotifier notifier;
  const HomeAppBar({required this.notifier, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: getWidth(context) * 0.08,
            backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            ),
          ),

          (10.0).width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // (2.0).height,
              Text(
                'Livia Vaccaro',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            PathConstant.notification,
            height: 26,
          ),
        ],
      ),
    );
  }
}
