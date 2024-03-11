import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/PrimaryButton.dart';
import '../../../../widgets/app_large_text.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/vertical_dots.dart';
import '../../presentation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  List listImage = ["intro_th.png", "intro_f.png", "intro_s.png"];
  final PageController _pageController = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listImage.length,
          controller: _pageController,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/" + listImage[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Trips"),
                        const AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 250,
                            child: const AppText(
                                text: "Mountain hikes give you an incredible "
                                    "sense of freedom along with denurance test")),
                        const SizedBox(
                          height: 40,
                        ),
                        PrimaryButton(
                          onClick: doSwipePage,
                        )
                      ],
                    ),
                    VerticalDotsIndicator(
                        itemCount: listImage.length, currentIndex: index)
                  ],
                ),
              ),
            );
          }),
    );
  }

  void doSwipePage() {
    if (_pageController.page! < listImage.length - 1) {
      _pageController.animateToPage(_pageController.page!.toInt() + 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInCubic);
    } else {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => const MainPage()));
    }
  }
}
