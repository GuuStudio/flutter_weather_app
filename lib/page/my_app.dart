import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/apps/config/theme_custom.dart';
import 'package:weather/page/bottom_navigation/bottom_custom.dart';
import 'package:weather/providers/weather_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(), // Bọc toàn bộ các widget để watch và read.
      child: MaterialApp(
        theme: ThemeCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: const BottomNavigationCustom(),

      ),
    );
  }
}
