import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp2/screens/home_screen.dart';
import '../provider/weather_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WeatherDetailScreen extends StatelessWidget {
  //const WeatherDetailScreen({super.key});
  final Uri googleWeatherUrl =
      Uri.parse('https://www.accuweather.com/en/in/india-weather');

  const WeatherDetailScreen({super.key});

  Future<void> _launchURL(BuildContext context) async {
    final Uri url = googleWeatherUrl;
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weatherData = weatherProvider.weatherData!;

    return Scaffold(
      backgroundColor: const Color.fromARGB(206, 237, 159, 184),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 52, 30, 30),
            ),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          backgroundColor: Colors.transparent,
          title: const Text(
            'Weather Details',
            style: TextStyle(
                color: Color.fromARGB(255, 36, 39, 39),
                fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '${weatherData['name']}',
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 32, 56)),
              ),
              const SizedBox(height: 10),
              Text(
                '${weatherData['main']['temp']}°${weatherProvider.units == 'metric' ? 'C' : 'F'}',
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 64, 64, 65)),
              ),
              const SizedBox(height: 10),
              Text(
                weatherData['weather'][0]['description']
                    .toString()
                    .toUpperCase(),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/15.png'),
                      ),
                      const SizedBox(height: 5),
                      Text('${weatherData['main']['humidity']}% Humidity',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 14, 14, 14),
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/17.jpg'),
                      ),
                      const SizedBox(height: 5),
                      Text('${weatherData['wind']['speed']} m/s Wind',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 18, 18, 18),
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 120.0),
                child: Center(
                  child: Image.asset('images/13.webp'),
                ),
              ),
              TextButton(
                onPressed: () => _launchURL(context),
                child: const Text('Check Google Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
