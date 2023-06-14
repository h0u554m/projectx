import 'package:flutter/material.dart';

class CustomCircularProgress extends StatefulWidget {
  const CustomCircularProgress({super.key});

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
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
            width:
                55, // Increase the width to make the circular progress indicator larger
            height:
                55, // Increase the height to make the circular progress indicator larger
            child: CircularProgressIndicator(
              value: 0.75, // The progress value between 0.0 and 1.0
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF46D41)),
              strokeWidth: 2,
            ),
          )
        ],
      ),
    );
  }
}
