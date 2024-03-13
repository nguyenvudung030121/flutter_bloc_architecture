import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // Set your desired width
        height: 200, // Set your desired height
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://cdn.dummyjson.com/product-images/1/1.jpg',
              width: 300, // Ensure it matches the container's width
              height: 200, // Ensure it matches the container's height
              fit: BoxFit.cover, // Cover the container's boundaries
            ),
            ClipPath(
              clipper: RectangleClipper(),
              // Use our custom clipper for rectangle
              child: Container(
                width: 300,
                height: 200,
                color:
                    Colors.black.withOpacity(0.5), // Semi-transparent overlay
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Path covering the whole area
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    // Rectangle path for the hole
    var rectanglePath = Path();
    // Define the rectangle size and position here
    double left = 50.0;
    double top = 50.0;
    double right = 250.0;
    double bottom = 150.0;
    rectanglePath.addRect(Rect.fromLTRB(left, top, right, bottom));
    // Subtract the rectangle from the full path to create a hole
    path = Path.combine(PathOperation.difference, path, rectanglePath);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
