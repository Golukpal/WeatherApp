import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Map<String, dynamic>? weatherData;
  bool isLoading = false;
  String units = 'metric';  // Default to Celsius

  Future<void> getWeather(String city) async {
    isLoading = true;
    notifyListeners();
    
    try {
      weatherData = await WeatherService().fetchWeather(city, units);
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleUnits() {
    units = (units == 'metric') ? 'imperial' : 'metric';
    notifyListeners();
  }
}
