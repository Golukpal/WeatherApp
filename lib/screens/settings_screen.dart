import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/weather_provider.dart';
import 'feedback_screen.dart';
import 'about_screen.dart';
import 'contactus_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    showFeedbackDialog(BuildContext context) {}

    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 121, 193, 241),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.circle, size: 15, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'Convert to Celsius',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              trailing: Switch(
                value: weatherProvider.units == 'metric',
                onChanged: (value) {
                  weatherProvider.toggleUnits();
                },
                onFocusChange: (value) {},
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 15, color: Colors.black),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeedbackScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Give Feedback',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 16, 16, 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 15, color: Colors.black),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutUsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 16, 16, 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 15, color: Colors.black),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 16, 16, 17),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
