import 'package:expenses_tracker/screens/auth/login/login_screen.dart';
import 'package:expenses_tracker/screens/onboarding/widgets/onboarding_page.dart';
import 'package:expenses_tracker/utils/constants/images.dart';
import 'package:expenses_tracker/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controller to keep track of which page we're on
  final PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Page View
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              OnboardingPage(
                  image: EImages.onboarding1,
                  title: ETexts.onboardingTitle1,
                  subTitle: ETexts.onboardingMessage1),
              OnboardingPage(
                  image: EImages.onboarding2,
                  title: ETexts.onboardingTitle2,
                  subTitle: ETexts.onboardingMessage2),
              OnboardingPage(
                  image: EImages.onboarding3,
                  title: ETexts.onboardingTitle3,
                  subTitle: ETexts.onboardingMessage3),
            ],
          ),

          // Dot Indicator
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(ETexts.skip),
                ),

                // Dot Indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // Next

                // LastPage => Done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(ETexts.done),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(ETexts.next),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
