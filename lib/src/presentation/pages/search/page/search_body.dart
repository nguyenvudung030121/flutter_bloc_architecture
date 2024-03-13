import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocxx/colors/AppColors.dart';
import 'package:flutter_blocxx/src/presentation/pages/search/bloc/search_bloc.dart';
import 'package:flutter_blocxx/widgets/app_large_text.dart';
import 'package:flutter_blocxx/widgets/app_text.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../data/model/product/product.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
        listener: (BuildContext context, SearchState state) {
      if (state.status == ProductStatus.initial ||
          state.status == ProductStatus.loading) {
        EasyLoading.show();
      }

      if (state.status == ProductStatus.loaded) {
        EasyLoading.dismiss();
      }
    }, child: BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        return SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: const AppLargeText(
                        text: 'Search',
                        alignment: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    state.product != null
                        ? Expanded(
                            child: _listProduct(context, state.product!, 1),
                          )
                        : const Center(),
                  ],
                )));
      },
    ));
  }

  Widget _listProduct(BuildContext context, Product product, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                // Container background color
                borderRadius: BorderRadius.circular(10.0),
                // Adjust corner radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    // Shadow color with transparency
                    offset: Offset(4.0, 4.0),
                    // Offset the shadow slightly
                    blurRadius: 5.0,
                    // Adjust blur radius for shadow softness
                  ),
                ],
                image: DecorationImage(
                    image: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      //import dart:ui
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget bulletWidget(String? value) {
    return ListTile(
        leading: const Icon(Icons.circle_outlined, size: 15),
        title: Text(
          value ?? 'None',
          style: const TextStyle(fontSize: 14),
        ),
        minLeadingWidth: 10,
        horizontalTitleGap: 10,
        minVerticalPadding: 5,
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        visualDensity: const VisualDensity(vertical: -4));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10.0;
    Path path = Path();
    path.fillType = PathFillType.evenOdd;

    // Top-left corner
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Top-right corner
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Bottom-right corner
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);

    // Bottom-left corner
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Complete the path with the top-left corner
    path.lineTo(0, radius);

    // Add a centered rounded rectangle inside the rounded rectangle
    double rectWidth = size.width - 20; // Width of the inner rounded rectangle
    double rectHeight = size.height * 0.6; // Height of the inner rounded
        // rectangle
    double innerRadius = 10.0; // Radius for the corners of the inner rounded rectangle
    Offset center = Offset(size.width / 2, size.height / 1.6); // Center of the
    // clipping area
    Offset topLeft = Offset(center.dx - rectWidth / 2, center.dy - rectHeight / 2); // Top-left corner of the inner rounded rectangle

    // Define the rounded rectangle
    RRect roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(topLeft.dx, topLeft.dy, rectWidth, rectHeight),
        Radius.circular(innerRadius)
    );

    // Add the rounded rectangle to the path
    path.addRRect(roundedRect);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
