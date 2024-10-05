import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_days_data.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/widgets/detail_body.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1D6CF3),
            Color(0xff19D2FE),
          ],
        ),
      ),
      child: FutureBuilder(
        future: context.read<WeatherProvider>().getWeatherMultiDay(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No Data'),
            );
          }
          List<WeatherMultiDayData> listData = snapshot.data as List<WeatherMultiDayData>;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.location,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  AnimatedTextKit(
                    pause: const Duration(seconds: 2),
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'DA NANG',
                        speed: const Duration(milliseconds: 100),
                      )
                    ],
                  )
                ],
              ),
              actions: const [
                Icon(
                  CupertinoIcons.search,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
            body: DetailBody(listData: listData,),
          );
        }
      ),
    );
  }
}
