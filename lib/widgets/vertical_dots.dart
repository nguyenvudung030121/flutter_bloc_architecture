import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/AppColors.dart';

class VerticalDotsIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const VerticalDotsIndicator({
    Key? key,
    required this.itemCount,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(itemCount, (index) {
        return Container(
          height: index == currentIndex ? 23 : 10,
          width: 10,
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: currentIndex == index ? AppColors.liberty : Colors.white,
          ),
        );
      }),
    );
  }
}
