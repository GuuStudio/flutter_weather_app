import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  const HomeDetailWeather({
    super.key,
    required this.humidity,
    required this.speedWind,
  });

  final num humidity;
  final num speedWind;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/icons/humidity.png'),
              Text(
                '${humidity.toString()}%',
                style: const TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/icons/wind.png'),
              Text(
                '${speedWind.toString()}Km/h',
                style: const TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
