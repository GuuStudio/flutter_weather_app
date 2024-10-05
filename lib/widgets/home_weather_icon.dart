import 'package:flutter/material.dart';
import 'package:weather/apps/utils/constants.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({
    super.key,
    required this.nameIcon,
  });

  final String nameIcon ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 2,
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        AssetCustom.getImageLink(nameIcon),
        fit: BoxFit.cover,
      ),
    );
  }
}
