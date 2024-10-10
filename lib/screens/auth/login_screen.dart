import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/app_widget.dart';
import 'package:to_do_app/screens/auth/auth_notifier.dart';
import 'package:to_do_app/utils/get_size.dart';
import 'package:to_do_app/utils/spacing_extension.dart';

import '../../components/button_text.dart';
import '../../components/custom_button.dart';
import '../../components/text_form_field_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(
      builder: (context, notifier, child) {
        return Scaffold(
          body: AppWidget(
            child: Container(
              width: getWidth(context),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    notifier.isLogin ? 'Login' : 'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  (getHeight(context) * 0.05).height,

                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  (6.0).height,
                  TextFormField(
                    controller: notifier.emailController,
                    decoration:
                    textFormFieldInputDecoration(context: context).copyWith(
                      hintText: 'Email',
                    ),
                  ),

                  (getHeight(context) * 0.02).height,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  (6.0).height,
                  TextFormField(
                    controller: notifier.passwordController,
                    decoration:
                    textFormFieldInputDecoration(context: context).copyWith(
                      hintText: 'Password',
                    ),
                  ),



                  (getHeight(context) * 0.06).height,
                  Center(
                    child: CustomButton(
                      onTap: () async {
                        notifier.authenticate(context);
                      },
                      widget: buttonText(
                        text: notifier.isLogin ? "Login" : "Sign up",
                      ),
                    ),
                  ),

                  (getHeight(context) * 0.012).height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        notifier.isLogin ? "Don't have an account? " : "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          notifier.updateAuthType();
                        },
                        child: Text(
                          notifier.isLogin ? "Sign Up" : "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),





                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       for(var i=0; i<5; i++)
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(26),
                  //           ),
                  //           padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20,),
                  //           margin: EdgeInsets.symmetric(
                  //             horizontal: 3,
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                 'May',
                  //                 style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.w500,
                  //                 ),
                  //               ),
                  //               (5.0).height,
                  //               Text(
                  //                 '23',
                  //                 style: TextStyle(
                  //                   fontSize: 24,
                  //                   fontWeight: FontWeight.w600,
                  //                 ),
                  //               ),
                  //               (5.0).height,
                  //               Text(
                  //                 'Fri',
                  //                 style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.w500,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
