import 'package:flutter/material.dart';

class CustomCircularProgress extends StatefulWidget {
  const CustomCircularProgress({super.key});

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> {
  @override
  Widget build(BuildContext context) {
    //here we can make props to get persantage
    return SizedBox(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const Center(
            child: Text(
              '75%',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(
              value: 0.75, // The progress value between 0.0 and 1.0
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
          ),
        ],
      ),
    );
  }
}
