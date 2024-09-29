import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = '423ae7fbc38afb18fa33fcd83a594e80';
  static const String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city, String units) async {
    final response =
        await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=$units'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
