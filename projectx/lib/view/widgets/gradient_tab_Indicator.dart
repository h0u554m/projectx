import 'package:flutter/material.dart';

class GradientTabIndicator extends Decoration {
  final BoxPainter _painter;

  GradientTabIndicator({required List<Color> colors, int away = 0})
      : _painter = _GradientPainter(colors, away);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _GradientPainter extends BoxPainter {
  final List<Color> colors;
  final int away;

  _GradientPainter(this.colors, this.away);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    //i make my own custom GradientTabIndicator
    const double indicatorHeight = 2.0;
    final double indicatorWidth = configuration.size!.width *
        0.4; // Adjust the scaling factor as per your preference
    final double dx =
        offset.dx + (configuration.size!.width - indicatorWidth) / 2.0;
    final double dy = configuration.size!.height - indicatorHeight - away;
    final Rect rect = Offset(dx, dy) & Size(indicatorWidth, indicatorHeight);
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: colors,
      ).createShader(rect);
    canvas.drawRect(rect, paint);
  }
}
