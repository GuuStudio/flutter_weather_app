import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  const HomeTemperature({
    super.key,
    required this.temp,
    this.tempSize = 100 ,
  });
  final num temp;
  final double tempSize;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp.round().toString(),
          style: TextStyle(
            fontSize: tempSize ,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
       Text(
          'o',
          style: TextStyle(
            fontSize: tempSize /  3,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}