import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_details_screen.dart';
import '../provider/weather_provider.dart';
import 'package:flutter/services.dart';
import '../screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 151, 196, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 83, 144, 192),
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        title: const Text('Weather App',
            style: TextStyle(
                color: Color.fromARGB(255, 23, 15, 5),
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            color: const Color.fromARGB(255, 10, 9, 4),
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context, // Use Navigator.push to navigate to the new screen
                MaterialPageRoute(
                    builder: (context) =>
                        const SettingsScreen()), // Wrap with Navigator.push
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 52, 53, 53),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 206, 230, 207)),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  suffixIcon: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.search,
                        color: Color.fromARGB(255, 234, 235, 236)),
                    onPressed: () {
                      context
                          .read<WeatherProvider>()
                          .getWeather(_cityController.text);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (weatherProvider.weatherData == null) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Search for a city',
                      style: TextStyle(color: Colors.white),
                    ),
                  ));
                } else {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<WeatherProvider>()
                              .getWeather(_cityController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WeatherDetailScreen(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.orangeAccent,
                          ),
                        ),
                        child: const Text('See Details'),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'Weather in ${weatherProvider.weatherData!['name']}',
                        style: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 70, 66, 65)),
                      ),
                    ],
                  );
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 65.0),
              child: Center(
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage('images/10.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
