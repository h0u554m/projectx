import 'package:flutter/material.dart';

class GradientTabIndicator extends Decoration {
  GradientTabIndicator({required List<Color> colors, int away = 0})
      : _painter = _GradientPainter(colors, away);

  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _GradientPainter extends BoxPainter {
  _GradientPainter(this.colors, this.away);

  final int away;
  final List<Color> colors;

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
