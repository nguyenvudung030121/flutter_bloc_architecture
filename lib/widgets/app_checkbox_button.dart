import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/AppColors.dart';

class AppCheckBoxButton extends StatelessWidget {
  final bool isChecked;
  final IconData leading;
  final Function()? onClick;

  const AppCheckBoxButton(
      {super.key, this.isChecked = false, required this.leading, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick!();
      },
      child: _customCheckBoxButton,
    );
  }

  Widget get _customCheckBoxButton {
    final isSelected = isChecked;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.liberty : AppColors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.liberty)),
      child: Icon(leading,
          color: isSelected ? AppColors.white : AppColors.liberty),
    );
  }
}
