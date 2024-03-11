import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/AppColors.dart';
import 'app_text.dart';

class PrimaryButton extends StatelessWidget {
  final bool isFlex;
  final void Function()? onClick;

  const PrimaryButton({super.key, this.isFlex = false, this.onClick});

  @override
  Widget build(BuildContext context) {
    return isFlex
        ? Expanded(child: flexButton())
        : GestureDetector(
            onTap: () {
              if (onClick != null) {
                onClick!();
              }
            },
            child: SizedBox(
              width: 300,
              child: fixedButton(),
            ),
          );
  }

  Widget flexButton() {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.liberty),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppText(text: 'Book Trip Now', color: AppColors.white),
            Icon(
              Icons.arrow_forward,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }

  Row fixedButton() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.liberty),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                )
              ],
            ),
          ),
        ),
        const Flexible(flex: 5, child: SizedBox())
      ],
    );
  }
}
