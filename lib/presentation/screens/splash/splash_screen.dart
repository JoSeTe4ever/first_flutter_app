import 'package:first_app/presentation/screens/splash/slides/logo.dart';
import 'package:first_app/presentation/screens/splash/slides/personal_data.dart';
import 'package:first_app/presentation/screens/splash/slides/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwipeablePageView extends StatefulWidget {
  const SwipeablePageView({super.key});

  @override
  State<SwipeablePageView> createState() => _SwipeablePageViewState();
}

class _SwipeablePageViewState extends State<SwipeablePageView> {
  final PageController _pageController =
      PageController(); // Initializing PageController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipeable Page View'),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children:  [
              const LogoPage(),
              PersonalDataPage(),
              const WelcomePage(),
            ],
          ),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
