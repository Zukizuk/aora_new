import 'package:aora_new/components/widgets/gradient_button.dart';
import 'package:aora_new/pages/sign_up_page.dart';
import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 115,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Image.asset('assets/images/cards.png'),
          const SizedBox(height: 25),
          Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Discover Endless Possibilities with',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Aora',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Positioned(
                      bottom: 3,
                      left: 0,
                      right: 20,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/images/path.png',
                          height: 13,
                          width: 65,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Where Creativity Meets Innovation: Embark on a Journey of Limitless Exploration with Aora",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          GradientButton(
            text: 'Continue with Email',
            onPressed: () {
              context.goNamed(SignUpPage.name);
            },
          ),
        ],
      ),
    );
  }
}
