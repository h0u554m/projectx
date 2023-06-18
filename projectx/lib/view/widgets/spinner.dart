import 'package:flutter/material.dart';

class Spinner extends StatefulWidget {
  const Spinner({super.key});

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(
          const SweepGradient(
            colors: [
              Color(0xFFC20EA1),
              Color(0xFFDD2D7F),
              Color(0xFFEE4C5E),
              Color(0xFFF46D41),
            ], // Specify
          ).colors.first,
        ),
        strokeWidth: 2,
      ),
    );
  }
}
