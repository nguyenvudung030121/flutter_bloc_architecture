import 'package:flutter/cupertino.dart';

import '../colors/AppColors.dart';
import 'app_text.dart';

class ItemExplore extends StatelessWidget {
  final IconData icons;
  final Color color;
  final Color iconColor;
  final String type;

  const ItemExplore({
    super.key,
    required this.icons,
    required this.color,
    required this.type,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      height: 65,
      width: 75,
      child: Column(
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
            child: Icon(
              icons,
              color: iconColor,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            text: type,
            size: 15,
            color: AppColors.liberty,
          )
        ],
      ),
    );
  }
}
