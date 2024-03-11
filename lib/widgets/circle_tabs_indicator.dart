import 'package:flutter/widgets.dart';

class CircleTabIndicator extends Decoration {
  final Color color;
  final double size;

  const CircleTabIndicator({
    required this.color,
    required this.size,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CircleTabIndicatorPainter(this, onChanged);
  }
}

class _CircleTabIndicatorPainter extends BoxPainter {
  final CircleTabIndicator decoration;

  _CircleTabIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Offset(
          offset.dx,
          configuration.size!.height - decoration.size,
        ) &
        Size(configuration.size!.width, decoration.size);

    final paint = Paint()
      ..color = decoration.color
      ..style = PaintingStyle.fill;

    final center = Offset(rect.center.dx, rect.bottom);
    final radius = decoration.size / 2;

    canvas.drawCircle(center, radius, paint);
  }
}
