import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/apps/utils/constants.dart';
import 'package:weather/models/weather_days_data.dart';
import 'package:weather/widgets/home_temperature.dart';

class DetailBody extends StatefulWidget {
  final List<WeatherMultiDayData> listData;

  const DetailBody({
    super.key,
    required this.listData,
  });

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {

  @override
  Widget build(BuildContext context) {
    final listData = widget.listData;
    return ListView.separated(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(listData[index].dt);
        String formatDay = DateFormat('EEEE').format(dateTime);
        String formatTime = DateFormat('HH:MM').format(dateTime);
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        HomeTemperature(
                          temp: listData[index].main.temp,
                          tempSize: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          listData[index].weather.main.toString(),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      formatDay,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      formatTime,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Image.asset(AssetCustom.getImageLink(listData[index].weather.description)),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: widget.listData.length,
    );
  }
}
