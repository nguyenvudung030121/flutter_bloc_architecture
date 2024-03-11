import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class ItemPlaces extends StatelessWidget {
  final String image;
  final String position;
  final String place;
  final bool isLastItem;
  final void Function(BuildContext context)? onClick;

  const ItemPlaces(
      {super.key,
      required this.image,
      required this.position,
      required this.place,
      this.isLastItem = false,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick!(context);
        }
      },
      child: Container(
        margin: !isLastItem
            ? const EdgeInsets.only(right: 20)
            : const EdgeInsets.only(right: 0),
        width: 180,
        height: 270,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: place,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppText(
                        text: position,
                        size: 14,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
