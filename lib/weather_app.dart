import 'package:flutter/material.dart';
import 'package:wheather_app/additional_info_card.dart';
import 'package:wheather_app/hourly_forecast_card.dart';
import 'package:http/http.dart' as http;

class WeatherAppHome extends StatefulWidget {
  const WeatherAppHome({super.key});
  @override
  State<WeatherAppHome> createState() => _WeatherAppHomeState();
}

class _WeatherAppHomeState extends State<WeatherAppHome> {
  @override
  String uri =
      'https://api.openweathermap.org/data/2.5/weather?q=London&APPID=KEY';
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    print('API Calling !');
    var response = await http.get(Uri.parse(uri));
    print(response.body);
    final data = response.body;
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  print('');
                },
                icon: Icon(Icons.replay),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                elevation: 2,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(children: [
                    Text('300 C',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo)),
                    Icon(
                      Icons.cloud,
                      size: 64,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Rain',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    )
                  ]),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Weather Forecast',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForeCastCard(
                      icon: Icons.wb_sunny, time: '09:00', value: '24 C'),
                  HourlyForeCastCard(
                      icon: Icons.cloud, time: '10:00', value: '28 C'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Additional Information',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdditionalInfoCard(
                  icon: Icons.water_drop,
                  title: 'Humidity',
                  value: '82%',
                ),
                AdditionalInfoCard(
                  icon: Icons.air,
                  title: 'Wind Speed',
                  value: '82%',
                ),
                AdditionalInfoCard(
                  icon: Icons.beach_access,
                  title: 'Pressure',
                  value: '82%',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Class HourlyForeCastCard
