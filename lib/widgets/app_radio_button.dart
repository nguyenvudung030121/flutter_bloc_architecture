import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/AppColors.dart';

class AppRadioButton extends StatelessWidget {
  final int value;
  final int selectedIndex;
  final String leading;
  final Function(int value)? onClick;

  const AppRadioButton(
      {super.key,
      required this.value,
      required this.selectedIndex,
      required this.leading,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick!(value);
      },
      child: _customRadioButton,
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == selectedIndex;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : AppColors.eggblue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        leading,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
